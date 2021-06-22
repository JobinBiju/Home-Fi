import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_fi/app/modules/home/views/home_view.dart';

class SplashScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  // animation controller for lottie
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    // spalsh animation config
    animationController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // checkLogin();
        Timer(
          Duration(milliseconds: 1000),
          () => Get.off(() => HomeView()),
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
