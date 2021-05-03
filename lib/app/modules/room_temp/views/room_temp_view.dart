import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/room_temp_controller.dart';

class RoomTempView extends GetView<RoomTempController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RoomTempView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RoomTempView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
