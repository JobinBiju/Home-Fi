import 'package:flutter/material.dart';

import '../theme/color_theme.dart';

class AnimatedSwitch extends StatelessWidget {
  final List<bool> isToggled;
  final int index;
  final void Function() onTap;

  const AnimatedSwitch({
    Key? key,
    required this.isToggled,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28,
        width: 46,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColor,
            )),
        child: Stack(
          children: [
            AnimatedCrossFade(
              firstChild: Container(
                height: 30,
                width: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.transparent,
                ),
              ),
              secondChild: Container(
                height: 30,
                width: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Theme.of(context).primaryColor,
                ),
              ),
              crossFadeState: isToggled[index]
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(
                milliseconds: 200,
              ),
            ),
            AnimatedAlign(
              duration: Duration(
                milliseconds: 300,
              ),
              alignment: isToggled[index]
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                height: 42 * 0.5,
                width: 42 * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isToggled[index]
                      ? GFTheme.white1
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
