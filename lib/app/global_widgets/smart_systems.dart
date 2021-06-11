import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_fi/app/global_widgets/animated_switch.dart';
import 'package:home_fi/app/modules/home/controllers/home_controller.dart';
import 'package:home_fi/app/theme/text_theme.dart';

import '../theme/color_theme.dart';

class SmartSystem extends StatelessWidget {
  final controller = Get.put(HomeController());
  final Size size;
  final Color color;
  final int index;
  final String title;
  final String imageUrl;

  SmartSystem({
    Key key,
    @required this.size,
    this.color,
    this.index,
    this.title,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.414,
      width: size.width * 0.4,
      margin: EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.width * 0.06,
              width: size.width * 0.34,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color.withOpacity(0.45)),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: size.width * 0.4,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 8,
                    left: 5,
                    child: Image(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.fill,
                      width: 80,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 15,
                    child: AnimatedSwitch(
                      isToggled: controller.isToggled,
                      index: index,
                      onTap: () {
                        controller.onSwitched(index);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 15,
                    child: Text(
                      title,
                      style: kSub2HeadTextStyle.copyWith(
                        color: GFTheme.primaryMaroon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
