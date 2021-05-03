import 'package:get/get.dart';

import '../controllers/room_temp_controller.dart';

class RoomTempBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomTempController>(
      () => RoomTempController(),
    );
  }
}
