import 'package:flutter/material.dart';
import 'package:sambapos_desktop/init/locale_keys.g.dart';
import 'package:sambapos_desktop/model/contextExtension.dart';
import 'package:sambapos_desktop/view/payment_method.dart';
import 'package:sambapos_desktop/widgets/elevated_button.dart';
import 'package:sambapos_desktop/widgets/navbar_first.dart';
import 'package:sambapos_desktop/init/extensions/string_extensions.dart';

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
  


