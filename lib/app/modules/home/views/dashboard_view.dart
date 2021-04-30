import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
              }),
        ],
      ),
    );
  }
}
