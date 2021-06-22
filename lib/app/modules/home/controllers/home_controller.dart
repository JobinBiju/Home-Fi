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

  // Connected Bluetoth device
  //late BluetoothDevice connectedDevice;

  // temperature from sensor;
  String serviceUuid = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  String characteristicUuid = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
  var isReady = false.obs;
  // late Stream<List<int>> stream;
  // late Stream<List<int>> streamR;
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

  // funtions to get temp data
  // discoverServices(BluetoothDevice device) async {
  //   List<BluetoothService> services = await device.discoverServices();
  //   services.forEach((service) {
  //     if (service.uuid.toString() == serviceUuid) {
  //       service.characteristics.forEach((characteristic) {
  //         if (characteristic.uuid.toString() == characteristicUuid) {
  //           characteristic.setNotifyValue(!characteristic.isNotifying);
  //           stream = characteristic.value;
  //           isReady.value = true;
  //         }
  //       });
  //     }
  //   });
  // }

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

  // function to convert sensor data
  // String dataParser(List<int>? dataFromDevice) {
  //   return utf8.decode(dataFromDevice!);
  // }

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
