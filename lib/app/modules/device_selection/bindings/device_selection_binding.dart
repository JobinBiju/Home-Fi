import 'package:get/get.dart';

import '../controllers/device_selection_controller.dart';

class DeviceSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeviceSelectionController>(
      () => DeviceSelectionController(),
    );
  }
}
