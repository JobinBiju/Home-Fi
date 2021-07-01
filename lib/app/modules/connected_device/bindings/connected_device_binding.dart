import 'package:get/get.dart';

import '../controllers/connected_device_controller.dart';

class ConnectedDeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectedDeviceController>(
      () => ConnectedDeviceController(),
    );
  }
}
