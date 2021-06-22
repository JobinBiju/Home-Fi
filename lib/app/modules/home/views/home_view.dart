import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Obx(() => controller.navBarSwitcher()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 45),
            height: 110,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.home,
                        size: controller.currentIndex == 0 ? 26 : 22,
                        color: controller.currentIndex == 0
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.5),
                      ),
                      onPressed: () {
                        controller.setCurrentIndex(0);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.userFriends,
                        size: controller.currentIndex == 1 ? 26 : 22,
                        color: controller.currentIndex == 1
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.5),
                      ),
                      onPressed: () {
                        controller.setCurrentIndex(1);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.cog,
                        size: controller.currentIndex == 2 ? 26 : 22,
                        color: controller.currentIndex == 2
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.5),
                      ),
                      onPressed: () {
                        controller.setCurrentIndex(2);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
