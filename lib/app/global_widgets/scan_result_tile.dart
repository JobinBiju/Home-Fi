import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:home_fi/app/theme/text_theme.dart';

class ScanResultTile extends StatelessWidget {
  final ScanResult result;
  final VoidCallback? onTap;

  const ScanResultTile({
    Key? key,
    required this.result,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: _buildTitle(context),
      leading: Text(result.rssi.toString()),
      trailing: ElevatedButton(
        child: Text(
          'Connect',
          style: HomeFiTextTheme.kSubHeadTextStyle.copyWith(
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          padding: EdgeInsets.all(5),
        ),
        onPressed: (result.advertisementData.connectable) ? onTap : null,
      ),
      children: [],
    );
  }

  Widget _buildTitle(BuildContext context) {
    if (result.device.name.length > 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            result.device.name,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            result.device.id.toString(),
            style: Theme.of(context).textTheme.caption,
          )
        ],
      );
    } else {
      return Text(result.device.id.toString());
    }
  }
}
