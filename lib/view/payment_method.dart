import 'package:flutter/material.dart';
import 'package:sambapos_desktop/model/contextExtension.dart';
import 'package:sambapos_desktop/view/products.dart';
import 'package:sambapos_desktop/view/view.dart';
import 'package:sambapos_desktop/widgets/elevated_button.dart';
import 'package:sambapos_desktop/init/extensions/string_extensions.dart';
import 'package:sambapos_desktop/init/locale_keys.g.dart';
import 'dart:io';
import 'package:sambapos_desktop/constant/constants.dart';
import 'package:easy_localization/easy_localization.dart';

class PaymentMethod extends StatefulWidget {
  PaymentMethod({Key key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final buttonColor = Colors.white;
  final resim =
      "https://i4.hurimg.com/i/hurriyet/75/750x422/5eca5464d3806c225429d41f.jpg";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /* bottomNavigationBar: MySecondBottomNavbar(
          onpressedNavbar: FirstPageUi(),
        ),*/
        bottomNavigationBar: MyFirstBottomNavbar(),
        body: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(resim), fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(LocaleKeys.paymenttype_pagetitle.locale,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                buttonGroup(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buttonGroup(BuildContext context) {
    return Padding(
      padding: context.paddingAllow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ExpandedButton(
            onpressed: Products(),
            icon: Icons.payment,
            buttonColor: buttonColor,
            textPosition: LocaleKeys.paymenttype_pagebuttonleft.locale,
          ),
          SizedBox(
            width: context.dynamicWidth(0.01),
          ),
          ExpandedButton(
              onpressed: Products(),
              buttonColor: buttonColor,
              textPosition: LocaleKeys.paymenttype_pagebuttonmid.locale,
              icon: Icons.credit_card),
          SizedBox(
            width: context.dynamicWidth(0.01),
          ),
          ExpandedButton(
              onpressed: Products(),
              buttonColor: buttonColor,
              textPosition: LocaleKeys.paymenttype_pagebuttonright.locale,
              icon: Icons.qr_code),
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
                    MaterialPageRoute(builder: (context) => FirstPageUi()));
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
          IconButton(icon: Icon(Icons.fullscreen_exit), onPressed: () {}),
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
