import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_fi/app/global_widgets/room_selector.dart';
import 'package:home_fi/app/global_widgets/smart_systems.dart';
import 'package:home_fi/app/global_widgets/user_avathar.dart';
import 'package:home_fi/app/modules/home/controllers/home_controller.dart';
import 'package:home_fi/app/modules/room_temp/views/room_temp_view.dart';
import 'package:home_fi/app/theme/color_theme.dart';
import 'package:home_fi/app/theme/text_theme.dart';

class DashboardView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.067),
      height: size.height,
      width: size.width,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: size.height * 0.08),
          GetBuilder<HomeController>(
            id: 7,
            builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome\nHome, ${controller.userName}',
                    style: HomeFiTextTheme.kSubHeadTextStyle
                        .copyWith(color: Theme.of(context).primaryColorDark),
                  ),
                  GestureDetector(
                    // onTap: () => Get.to(() => ProfileView()),
                    child: UserAvatar(
                      ismale: controller.isMale,
                      radius: size.width * 0.075,
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: size.height * 0.03),
          Expanded(
            child: Container(
              width: size.width * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Text(
                      'Rooms',
                      style: HomeFiTextTheme.kSub2HeadTextStyle
                          .copyWith(color: Theme.of(context).primaryColorDark),
                    ),
                    SizedBox(height: size.height * 0.02),
                    GetBuilder<HomeController>(
                      init: HomeController(),
                      id: 1,
                      builder: (_) {
                        return Container(
                          width: size.width,
                          height: size.height * 0.12,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.rooms.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: RoomSelector(
                                  roomName: controller.rooms[index].roomName,
                                  roomImageURL:
                                      controller.rooms[index].roomImgUrl,
                                  isSelected: controller.selectedRoom[index],
                                  onTap: () {},
                                ),
                                onTap: () {
                                  controller.roomChange(index);
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                            () => RoomTempView(d: controller.connectedDevice));
                      },
                      child: Container(
                        height: Get.height * 0.082,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Room\nTemperature',
                              style:
                                  HomeFiTextTheme.kSub2HeadTextStyle.copyWith(
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                            Obx(
                              () => !controller.isReady.value
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : StreamBuilder<List<int>>(
                                      stream: controller.stream,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<int>> snapshot) {
                                        if (snapshot.hasError)
                                          return Text('NULL');

                                        if (snapshot.connectionState ==
                                            ConnectionState.active) {
                                          controller
                                              .retreveSensorData(snapshot.data);

                                          return Text(
                                            '${controller.temp.value}°c',
                                            style: HomeFiTextTheme
                                                .kSub2HeadTextStyle
                                                .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                              fontSize: 28,
                                            ),
                                          );
                                        } else {
                                          return Column(
                                            children: [
                                              Text('Check the stream'),
                                            ],
                                          );
                                        }
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Smart Systems',
                      style: HomeFiTextTheme.kSub2HeadTextStyle
                          .copyWith(color: Theme.of(context).primaryColorDark),
                    ),
                    SizedBox(height: size.height * 0.03),
                    GetBuilder<HomeController>(
                      id: 2,
                      builder: (_) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SmartSystem(
                                  size: size,
                                  color: GFTheme.lightPurple,
                                  index: 0,
                                  title: 'LED Light',
                                  imageUrl: 'assets/images/icons8-light-96.png',
                                ),
                                SmartSystem(
                                  size: size,
                                  color: GFTheme.lightBlue,
                                  index: 1,
                                  title: 'RGB LED',
                                  imageUrl:
                                      'assets/images/icons8-rgb-lamp-96.png',
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SmartSystem(
                                  size: size,
                                  color: GFTheme.lightYellow,
                                  index: 2,
                                  title: 'Music Player',
                                  imageUrl:
                                      'assets/images/icons8-music-record-96.png',
                                ),
                                SmartSystem(
                                  size: size,
                                  color: GFTheme.lightPeach,
                                  index: 3,
                                  title: 'LED Light 2',
                                  imageUrl: 'assets/images/icons8-light-96.png',
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: size.height * 0.14),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
