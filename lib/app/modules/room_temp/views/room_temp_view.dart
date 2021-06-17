import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:get/get.dart';
import 'package:home_fi/app/theme/text_theme.dart';

import '../controllers/room_temp_controller.dart';

class RoomTempView extends GetView<RoomTempController> {
  final RoomTempController controller = Get.put(RoomTempController());
  final BluetoothDevice d;

  RoomTempView({required this.d}) {
    controller.discoverServices(d);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sensor Data',
          style:
              HomeFiTextTheme.kSub2HeadTextStyle.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Obx(
          () => !controller.isReady.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : StreamBuilder<List<int>>(
                  stream: controller.stream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<int>> snapshot) {
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');

                    if (snapshot.connectionState == ConnectionState.active) {
                      controller.retreveSensorData(snapshot.data);

                      return Column(
                        children: [
                          SizedBox(height: 50),
                          Text(
                            'Temp: ${controller.temp.value}',
                            style: HomeFiTextTheme.kSubHeadTextStyle,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Humidity: ${controller.humidity.value}',
                            style: HomeFiTextTheme.kSubHeadTextStyle,
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Text(d.name),
                          Text('Check the stream'),
                        ],
                      );
                    }
                  }),
        ),
      ),
    );
  }
}
