import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_fi/app/data/models/adafruit_get.dart';
import 'package:home_fi/app/data/models/room_model.dart';
import 'package:home_fi/app/data/provider/TempHumidAPI.dart';
import 'package:home_fi/app/modules/home/views/dashboard_view.dart';
import 'package:home_fi/app/modules/home/views/settings_view.dart';
import 'package:home_fi/app/modules/home/views/users_view.dart';

class HomeController extends GetxController {
  // bottom nav current index.
  RxInt _currentIndex = 0.obs;
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

  // AdafruitGET & AdafruitGET from sensor;
  late StreamController<AdafruitGET> tempStream;
  late StreamController<AdafruitGET> humidStream;
  late StreamController<AdafruitGET> led1Stream;

  // funtion to set current index
  setCurrentIndex(int index) {
    _currentIndex.value = index;
    if (index == 1 || index == 2) {
      tempStream.close();
      humidStream.close();
      led1Stream.close();
    } else if (index == 0) {
      streamInit();
    }
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
    if (index == 0) {
      var value = isToggled[index] ? "1" : "0";
      TempHumidAPI.updateLed1Data(value);
    }
    update([2, true]);
  }

  // function to retreve sensor data
  retreveSensorData() async {
    // AdafruitGET data fetch
    AdafruitGET temper = await TempHumidAPI.getTempData();
    tempStream.add(temper);

    // AdafruitGET data fetch
    AdafruitGET humid = await TempHumidAPI.getHumidData();
    humidStream.add(humid);
  }

  getSmartSystemStatus() async {
    var data = await TempHumidAPI.getLed1Data();
    var value = int.parse(data.lastValue!);
    if (value == 1) {
      isToggled[0] = true;
    } else if (value == 0) {
      isToggled[0] = false;
    }
    update([2, true]);
  }

  streamInit() {
    tempStream = StreamController();
    humidStream = StreamController();
    humidStream = StreamController();
    Timer.periodic(Duration(seconds: 6), (_) {
      retreveSensorData();
      getSmartSystemStatus();
    });
  }

  @override
  void onInit() {
    streamInit();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tempStream.close();
    humidStream.close();
    led1Stream.close();
  }
}
