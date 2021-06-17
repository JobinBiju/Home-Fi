import 'dart:convert';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:home_fi/app/modules/home/controllers/home_controller.dart';

class RoomTempController extends GetxController {
  // late BluetoothDevice device;
  String serviceUuid = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  String characteristicUuid = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
  var isReady = false.obs;
  late Stream<List<int>> stream;
  late List temphumidata;
  var temp = 0.0.obs;
  var humidity = 0.0.obs;

  discoverServices(BluetoothDevice device) async {
    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == serviceUuid) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == characteristicUuid) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            stream = characteristic.value;
            isReady.value = true;
          }
        });
      }
    });
  }

  // function to retreve sensor data
  retreveSensorData(List<int>? dataFromDevice) {
    var currentValue = dataParser(dataFromDevice);
    temphumidata = currentValue.split(",");

    if (temphumidata[0] != "nan") {
      temp.value = double.parse('${temphumidata[0]}');
    }
    if (temphumidata[1] != "nan") {
      humidity.value = double.parse('${temphumidata[1]}');
    }
  }

  // function to convert sensor data
  String dataParser(List<int>? dataFromDevice) {
    return utf8.decode(dataFromDevice!);
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
