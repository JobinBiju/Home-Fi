import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/connected_device_controller.dart';

class ConnectedDeviceView extends GetView<ConnectedDeviceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConnectedDeviceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ConnectedDeviceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
