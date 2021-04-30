import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SettingsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
