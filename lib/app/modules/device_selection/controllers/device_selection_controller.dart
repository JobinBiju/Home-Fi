import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class DeviceSelectionController extends GetxController {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  late BluetoothDevice d;

  getBlDevices() {
    // var subscription = flutterBlue.scanResults.listen((results) {
    //   // do something with scan results
    //   for (ScanResult r in results) {
    //     print('${r.device.name} found! rssi: ${r.rssi}');
    //   }
    // });
    // subscription.cancel();
    // flutterBlue.stopScan();
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DeviceSelectionController &&
      other.flutterBlue == flutterBlue &&
      other.d == d;
  }

  @override
  int get hashCode => flutterBlue.hashCode ^ d.hashCode;
}
