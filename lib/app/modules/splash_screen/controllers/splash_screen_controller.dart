import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController
    with SingleGetTickerProviderMixin {
// animation controller for lottie
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    // spalsh animation config
    AnimationController animationController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // checkLogin();
        Timer(
          Duration(milliseconds: 1000),
          () => Get.offNamed('/home'),
        );
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
