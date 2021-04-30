import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_automation/app/global_widgets/room_selector.dart';
import 'package:home_automation/app/global_widgets/user_avathar.dart';
import 'package:home_automation/app/modules/home/controllers/home_controller.dart';
import 'package:home_automation/app/theme/text_theme.dart';

class DashboardView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.065),
      height: size.height,
      width: size.width,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.08,
          ),
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
          SizedBox(height: size.height * 0.06),
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
                        roomImageURL: controller.rooms[index].roomImgUrl,
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
          Text(
            'Smart Systems',
            style: kSub2HeadTextStyle.copyWith(
                color: Theme.of(context).primaryColorDark),
          ),
        ],
      ),
    );
  }
}
