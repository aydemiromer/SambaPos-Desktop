import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sambapos_desktop/constant/constants.dart';
import 'package:sambapos_desktop/view/view.dart';
import 'package:easy_localization/easy_localization.dart';

class MyFirstBottomNavbar extends StatelessWidget {
  const MyFirstBottomNavbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstPageUi()));
              }),
          IconButton(
              icon: Icon(
                Icons.language,
                color: Colors.grey,
              ),
              onPressed: () {
                context.locale = AppConstant.SUPPORTED_LOCALE[
                    Random().nextInt(AppConstant.SUPPORTED_LOCALE.length)];
              }),
          IconButton(icon: Icon(Icons.fullscreen_exit), onPressed: null),
          IconButton(icon: Icon(Icons.settings), onPressed: null),
          IconButton(icon: Icon(Icons.power_settings_new), onPressed: null),
        ],
      ),
    );
  }
}
