import 'package:flutter/material.dart';
import 'package:sambapos_desktop/view/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sambapos_desktop/constant/constants.dart';
import 'dart:math';

class MySecondBottomNavbar extends StatelessWidget {
  const MySecondBottomNavbar({
    Key key,
    @required this.onpressedNavbar,
  }) : super(key: key);
  final onpressedNavbar;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => onpressedNavbar));
              }),
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
