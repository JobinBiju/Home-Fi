import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_fi/app/theme/color_theme.dart';
import 'package:home_fi/app/theme/text_theme.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GetBuilder<SplashScreenController>(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.width * 0.7,
                child: Lottie.asset(
                  'assets/lottie/light-bulb.json',
                  controller: _.animationController,
                  frameRate: FrameRate(60),
                  repeat: true,
                  onLoaded: (composition) {
                    _.animationController..duration = composition.duration;
                  },
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              Text(
                'Let There Be Light',
                style: HomeFiTextTheme.kHeadTextStyle.copyWith(
                  color: GFTheme.primaryGrey,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
