import 'package:flutter/material.dart';
import 'dart:io';
import 'package:sambapos_desktop/constant/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sambapos_desktop/view/payment_method.dart';
import 'package:sambapos_desktop/view/view.dart';
import 'package:sambapos_desktop/widgets/products_leftside.dart';
import 'package:sambapos_desktop/widgets/products_rightside.dart';

class Products extends StatefulWidget {
  const Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyFirstBottomNavbar(),
      body: Row(
        children: [
          LeftSide(),
          RightSide(),
        ],
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
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentMethod()));
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
                showDialog(
                  context: context,
                  builder: (context) {
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentMethod()));
                            },
                            child: Text("Ok"))
                      ],
                    );
                  },
                );
              }),
          IconButton(icon: Icon(Icons.fullscreen_exit), onPressed: null),
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
}
