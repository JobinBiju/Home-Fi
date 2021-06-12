import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class DeviceSelectionController extends GetxController {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  getBlDevices() {
    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });
    flutterBlue.stopScan();
  }

  @override
  void onInit() {
    super.onInit();
    flutterBlue.startScan(timeout: Duration(seconds: 4));
    getBlDevices();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
