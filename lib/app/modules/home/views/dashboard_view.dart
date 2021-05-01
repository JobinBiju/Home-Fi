import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_automation/app/global_widgets/room_selector.dart';
import 'package:home_automation/app/global_widgets/smart_systems.dart';
import 'package:home_automation/app/global_widgets/user_avathar.dart';
import 'package:home_automation/app/modules/home/controllers/home_controller.dart';
import 'package:home_automation/app/theme/color_theme.dart';
import 'package:home_automation/app/theme/text_theme.dart';

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
                    style: kSubHeadTextStyle.copyWith(
                        color: Theme.of(context).primaryColorDark),
                  ),
                  GestureDetector(
                    // onTap: () => Get.to(() => ProfileView()),
                    child: UserAvatar(
                      ismale: controller.isMale,
                      radius: size.width * 0.065,
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
                      style: kSub2HeadTextStyle.copyWith(
                          color: Theme.of(context).primaryColorDark),
                    ),
                    SizedBox(height: size.height * 0.02),
                    GetBuilder<HomeController>(
                      id: 1,
                      builder: (_) {
                        return Container(
                          width: size.width,
                          height: size.height * 0.12,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: RoomSelector(
                                  roomName: controller.rooms[index].roomName,
                                  roomImageURL:
                                      controller.rooms[index].roomImgUrl,
                                  isSelected: controller.selectedRoom[index],
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
                    Container(
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
                            style: kSub2HeadTextStyle.copyWith(
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                          Text(
                            '29°c',
                            style: kSub2HeadTextStyle.copyWith(
                              color: Theme.of(context).primaryColorDark,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Smart Systems',
                      style: kSub2HeadTextStyle.copyWith(
                          color: Theme.of(context).primaryColorDark),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmartSystem(size: size),
                            SmartSystem(size: size),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmartSystem(size: size),
                            SmartSystem(size: size),
                          ],
                        ),
                      ],
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
