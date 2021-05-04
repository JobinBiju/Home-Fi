import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../controllers/room_temp_controller.dart';

// class RoomTempView extends GetView<RoomTempController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('RoomTempView'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text(
//           'RoomTempView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
class RoomTempView extends StatefulWidget {
  const RoomTempView({Key key, this.device}) : super(key: key);
  final BluetoothDevice device;

  @override
  _RoomTempViewState createState() => _RoomTempViewState();
}

class _RoomTempViewState extends State<RoomTempView> {
  String service_uuid = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  String charaCteristic_uuid = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
  bool isReady;
  Stream<List<int>> stream;
  List _temphumidata;
  double _temp = 0;
  double _humidity = 0;
  @override
  void initState() {
    super.initState();
    isReady = false;
    connectToDevice();
  }

  void dispose() {
    widget.device.disconnect();
    super.dispose();
  }

  connectToDevice() async {
    if (widget.device == null) {
      _pop();
      return;
    }

    Timer(const Duration(seconds: 15), () {
      if (!isReady) {
        disconnectFromDevice();
        _pop();
      }
    });

    await widget.device.connect();
    discoverServices();
  }

  disconnectFromDevice() {
    if (widget.device == null) {
      _pop();
      return;
    }

    widget.device.disconnect();
  }

  discoverServices() async {
    if (widget.device == null) {
      _pop();
      return;
    }

    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == service_uuid) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == charaCteristic_uuid) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            stream = characteristic.value;

            setState(() {
              isReady = true;
            });
          }
        });
      }
    });

    if (!isReady) {
      _pop();
    }
  }

  Future<bool> _onWillPop() {
    return showDialog(
        context: context,
        builder: (context) =>
            new AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to disconnect device and go back?'),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('No')),
                new FlatButton(
                    onPressed: () {
                      disconnectFromDevice();
                      Navigator.of(context).pop(true);
                    },
                    child: new Text('Yes')),
              ],
            ) ??
            false);
  }

  _pop() {
    Navigator.of(context).pop(true);
  }

  String _dataParser(List<int> dataFromDevice) {
    return utf8.decode(dataFromDevice);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('dht11 Sensor'),
        ),
        body: Container(
            child: !isReady
                ? Center(
                    child: Text(
                      "Waiting...",
                      style: TextStyle(fontSize: 24, color: Colors.red),
                    ),
                  )
                : Container(
                    child: StreamBuilder<List<int>>(
                      stream: stream,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<int>> snapshot) {
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');

                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          // geting data from bluetooth
                          var currentValue = _dataParser(snapshot.data);
                          _temphumidata = currentValue.split(",");
                          if (_temphumidata[0] != "nan") {
                            _temp = double.parse('${_temphumidata[0]}');
                          }
                          if (_temphumidata[1] != "nan") {
                            _humidity = double.parse('${_temphumidata[1]}');
                          }

                          return HomeUI(
                            humidity: _humidity,
                            temperature: _temp,
                          );
                        } else {
                          return Text('Check the stream');
                        }
                      },
                    ),
                  )),
      ),
    );
  }
}
class HomeUI extends StatefulWidget {
  final double temperature;
  final double humidity;
  const HomeUI({Key key, this.temperature, this.humidity}) : super(key: key);
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: SvgPicture.asset(
                "assets/roof.svg",
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.black)),
                width: double.infinity,
                child: Column(
                  children: [
                    SleekCircularSlider(
                      appearance: CircularSliderAppearance(
                          customWidths: CustomSliderWidths(
                              trackWidth: 4,
                              progressBarWidth: 20,
                              shadowWidth: 40),
                          customColors: CustomSliderColors(
                              trackColor: HexColor('#ef6c00'),
                              progressBarColor: HexColor('#ffb74d'),
                              shadowColor: HexColor('#ffb74d'),
                              shadowMaxOpacity: 0.5, //);
                              shadowStep: 20),
                          infoProperties: InfoProperties(
                              bottomLabelStyle: TextStyle(
                                  color: HexColor('#6DA100'),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              bottomLabelText: 'Temp.',
                              mainLabelStyle: TextStyle(
                                  color: HexColor('#54826D'),
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w600),
                              modifier: (double value) {
                                return '${widget.temperature} ˚C';
                              }),
                          startAngle: 90,
                          angleRange: 360,
                          size: 200.0,
                          animationEnabled: true),
                      min: 0,
                      max: 100,
                      initialValue: widget.temperature,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SleekCircularSlider(
                      appearance: CircularSliderAppearance(
                          customWidths: CustomSliderWidths(
                              trackWidth: 4,
                              progressBarWidth: 20,
                              shadowWidth: 40),
                          customColors: CustomSliderColors(
                              trackColor: HexColor('#0277bd'),
                              progressBarColor: HexColor('#4FC3F7'),
                              shadowColor: HexColor('#B2EBF2'),
                              shadowMaxOpacity: 0.5, //);
                              shadowStep: 20),
                          infoProperties: InfoProperties(
                              bottomLabelStyle: TextStyle(
                                  color: HexColor('#6DA100'),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              bottomLabelText: 'Humidity.',
                              mainLabelStyle: TextStyle(
                                  color: HexColor('#54826D'),
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w600),
                              modifier: (double value) {
                                return '${widget.humidity} %';
                              }),
                          startAngle: 90,
                          angleRange: 360,
                          size: 200.0,
                          animationEnabled: true),
                      min: 0,
                      max: 100,
                      initialValue: widget.humidity,
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
