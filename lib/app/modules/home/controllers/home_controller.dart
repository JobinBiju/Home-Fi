import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_automation/app/modules/home/views/dashboard_view.dart';
import 'package:home_automation/app/modules/home/views/settings_view.dart';
import 'package:home_automation/app/modules/home/views/users_view.dart';

class HomeController extends GetxController {
  // bottom nav current index.
  var _currentIndex = 0.obs;
  get currentIndex => this._currentIndex.value;
  set currentIndex(index) => this._currentIndex.value = index;

  // the list of screens switched by bottom navBar
  final List<Widget> homeViews = [
    DashboardView(),
    UsersView(),
    SettingsView(),
  ];

  // function to return correct view on bottom navBar switch
  Widget navBarSwitcher() {
    return homeViews.elementAt(currentIndex);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
