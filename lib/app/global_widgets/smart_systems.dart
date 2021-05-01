import 'package:flutter/material.dart';
import 'package:home_automation/app/theme/color_theme.dart';

class SmartSystem extends StatelessWidget {
  const SmartSystem({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

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
                  color: GFTheme.lightPurple.withOpacity(0.5)),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: size.width * 0.4,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: GFTheme.lightPurple,
              ),
            ),
          )
        ],
      ),
    );
  }
}
