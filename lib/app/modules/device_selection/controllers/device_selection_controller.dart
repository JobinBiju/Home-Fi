import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class DeviceSelectionController extends GetxController {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  late BluetoothDevice d;

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
