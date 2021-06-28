import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:get/get.dart';
import 'package:home_fi/app/modules/home/controllers/home_controller.dart';

class RGBview extends GetView<HomeController> {
  RGBview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Obx(
          () => CircleColorPicker(
            controller: CircleColorPickerController(
              initialColor: HexColor(controller.newRGB.value),
            ),
            onChanged: (value) {},
            onEnded: (value) {
              var hex = '#${value.value.toRadixString(16).substring(2)}';
              controller.newRGB.value = hex;
              controller.sendRGBColor(hex);
            },
          ),
        ),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
