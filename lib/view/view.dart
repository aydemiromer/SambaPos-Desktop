import 'package:flutter/material.dart';
import 'package:sambapos_desktop/init/locale_keys.g.dart';
import 'package:sambapos_desktop/model/contextExtension.dart';
import 'package:sambapos_desktop/view/payment_method.dart';
import 'package:sambapos_desktop/widgets/elevated_button.dart';
import 'package:sambapos_desktop/init/extensions/string_extensions.dart';
import 'dart:io';
import 'package:sambapos_desktop/constant/constants.dart';
import 'package:easy_localization/easy_localization.dart';

class FirstPageUi extends StatefulWidget {
  @override
  _FirstPageUiState createState() => _FirstPageUiState();
}

class _FirstPageUiState extends State<FirstPageUi> {
  final buttonColor = Colors.white;
  final resim =
      "https://cdn.yemek.com/mncrop/940/625/uploads/2016/05/ev-yapimi-hamburger.jpg";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: MyFirstBottomNavbar(),
        backgroundColor: Colors.blueGrey,
        body: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(resim), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(LocaleKeys.view_pagetitle.locale,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              Padding(
                padding: context.paddingAllow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExpandedButton(
                        onpressed: PaymentMethod(),
                        buttonColor: buttonColor,
                        textPosition: LocaleKeys.view_pagebuttonleft.locale,
                        icon: Icons.restaurant),
                    SizedBox(
                      width: context.dynamicWidth(0.01),
                    ),
                    ExpandedButton(
                        onpressed: PaymentMethod(),
                        buttonColor: buttonColor,
                        textPosition: LocaleKeys.view_pagebuttonright.locale,
                        icon: Icons.shopping_bag),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.language,
                color: Colors.grey,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return alertDioalogview(context);
                  },
                );
              }),
          IconButton(
              icon: Icon(
                Icons.fullscreen_exit,
                color: Colors.grey,
              ),
              onPressed: () {}),
          IconButton(icon: Icon(Icons.settings), onPressed: null),
          IconButton(
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.grey,
              ),
              onPressed: () {
                exit(0);
              }),
        ],
      ),
    );
  }

  AlertDialog alertDioalogview(BuildContext context) {
    return AlertDialog(
      actions: [
        ElevatedButton(
            onPressed: () {
              context.locale = AppConstant.GB_LOCALE;
            },
            child: Column(
              children: [
                Icon(Icons.language),
                Text("EN-UK"),
              ],
            )),
        ElevatedButton(
            onPressed: () {
              context.locale = AppConstant.EN_LOCALE;
            },
            child: Column(
              children: [
                Icon(Icons.language),
                Text("EN-US"),
              ],
            )),
        ElevatedButton(
            onPressed: () {
              context.locale = AppConstant.TR_LOCALE;
            },
            child: Column(
              children: [
                Icon(Icons.language),
                Text("TR"),
              ],
            )),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstPageUi()));
            },
            child: Text("Ok"))
      ],
    );
  }
}
