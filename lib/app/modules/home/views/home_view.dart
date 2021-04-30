import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(22),
        height: Get.height * 0.16,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          height: Get.height * 0.06,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.home,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.userFriends,
                  color: Theme.of(context).primaryColorLight,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.cog,
                  color: Theme.of(context).primaryColorLight,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
