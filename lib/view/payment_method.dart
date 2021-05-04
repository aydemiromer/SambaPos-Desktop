import 'package:flutter/material.dart';
import 'package:sambapos_desktop/model/contextExtension.dart';
import 'package:sambapos_desktop/view/view.dart';
import 'package:sambapos_desktop/widgets/elevated_button.dart';

class PaymentMethod extends StatefulWidget {
  PaymentMethod({Key key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _selectedIndex = 0;

  final buttonColor = Colors.white;
  final textTop = "Select Your Payment Method";
  final textleftButton = "CASH";
  final textmidButton = "CREDIT CARD";
  final textrightButton = "WAMO QR";
  final resim =
      "https://i4.hurimg.com/i/hurriyet/75/750x422/5eca5464d3806c225429d41f.jpg";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: bottomNavbar(),
        body: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(resim), fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(textTop,
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
              onpressed: null,
              icon: Icons.payment,
              buttonColor: buttonColor,
              textPosition: textleftButton),
          SizedBox(
            width: context.dynamicWidth(0.01),
          ),
          ExpandedButton(
              onpressed: null,
              buttonColor: buttonColor,
              textPosition: textmidButton,
              icon: Icons.credit_card),
          SizedBox(
            width: context.dynamicWidth(0.01),
          ),
          ExpandedButton(
              onpressed: null,
              buttonColor: buttonColor,
              textPosition: textrightButton,
              icon: Icons.qr_code),
        ],
      ),
    );
  }

  BottomNavigationBar bottomNavbar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.language,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.power_settings_new),
          label: '',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
      onTap: (int index) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FirstPageUi()));
      },
    );
  }
}
