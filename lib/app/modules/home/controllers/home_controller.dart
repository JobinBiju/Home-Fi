import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_fi/app/data/models/temperature_model.dart';
import 'package:home_fi/app/data/models/humidity_model.dart';
import 'package:home_fi/app/data/models/room_model.dart';
import 'package:home_fi/app/data/provider/TempHumidAPI.dart';
import 'package:home_fi/app/modules/home/views/dashboard_view.dart';
import 'package:home_fi/app/modules/home/views/settings_view.dart';
import 'package:home_fi/app/modules/home/views/users_view.dart';

class HomeController extends GetxController {
  // bottom nav current index.
  var _currentIndex = 0.obs;
  get currentIndex => this._currentIndex.value;

  // userData
  String userName = 'Jobin';
  bool isMale = true;

  // List of bools for selected room
  List<bool> selectedRoom = [true, false, false, false, false];

  // the list of screens switched by bottom navBar
  final List<Widget> homeViews = [
    DashboardView(),
    UsersView(),
    SettingsView(),
  ];

  // List of room data
  List<Room> rooms = [
    Room(roomName: 'Living Room', roomImgUrl: 'assets/icons/sofa.svg'),
    Room(roomName: 'Dining Room', roomImgUrl: 'assets/icons/chair.svg'),
    Room(roomName: 'Bedroom', roomImgUrl: 'assets/icons/bed.svg'),
    Room(roomName: 'Kitchen', roomImgUrl: 'assets/icons/kitchen.svg'),
    Room(roomName: 'Bathroom', roomImgUrl: 'assets/icons/bathtub.svg'),
  ];

  List<bool> isToggled = [false, false, false, false];

  // temperature from sensor;
  var isReady = false.obs;
  late List temphumidata;
  var temp = 0.obs;
  var humidity = 0.obs;

  // funtion to set current index
  setCurrentIndex(int index) {
    _currentIndex.value = index;
    Get.forceAppUpdate();
  }

  // function to return correct view on bottom navBar switch
  Widget navBarSwitcher() {
    return homeViews.elementAt(currentIndex);
  }

  // function to move between each room
  void roomChange(int index) {
    selectedRoom = [false, false, false, false, false];
    selectedRoom[index] = true;
    update([1, true]);
  }

  // switches in the room
  onSwitched(int index) {
    isToggled[index] = !isToggled[index];
    update([2, true]);
  }

  // function to retreve sensor data
  retreveSensorData() async {
    // temperature data fetch
    Temperature temper = await TempHumidAPI.getTempData();
    temp.value = double.parse(temper.lastValue!).toInt();

    // humidity data fetch
    Humidity humid = await TempHumidAPI.getHumidData();
    humidity.value = double.parse(humid.lastValue!).toInt();

    isReady.value = true;
  }

  @override
  void onInit() {
    retreveSensorData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
