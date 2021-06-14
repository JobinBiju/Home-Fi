import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ScanResultTile extends StatelessWidget {
  final ScanResult result;
  final void Function() onTap;
  const ScanResultTile({Key? key, required this.result, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
