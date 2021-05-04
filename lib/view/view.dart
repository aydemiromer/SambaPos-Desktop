import 'package:flutter/material.dart';
import 'package:sambapos_desktop/model/contextExtension.dart';
import 'package:sambapos_desktop/view/payment_method.dart';
import 'package:sambapos_desktop/widgets/elevated_button.dart';

class FirstPageUi extends StatefulWidget {
  @override
  _FirstPageUiState createState() => _FirstPageUiState();
}

class _FirstPageUiState extends State<FirstPageUi> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final buttonColor = Colors.white;
  final textTop = "Dine In or Take Out ?";
  final textleftButton = "DINE IN";
  final textrightButton = "TAKE OUT";
  final resim =
      "https://cdn.yemek.com/mncrop/940/625/uploads/2016/05/ev-yapimi-hamburger.jpg";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: bottomNavbar(),
        backgroundColor: Colors.blueGrey,
        body: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(resim), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(textTop,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              Padding(
                padding: context.paddingAllow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExpandedButton(
                        onpressed: PaymentMethod(),
                        buttonColor: buttonColor,
                        textPosition: textleftButton,
                        icon: Icons.restaurant),
                    SizedBox(
                      width: context.dynamicWidth(0.01),
                    ),
                    ExpandedButton(
                        onpressed: PaymentMethod(),
                        buttonColor: buttonColor,
                        textPosition: textrightButton,
                        icon: Icons.shopping_bag)
                  ],
                ),
              )
            ],
          ),
        ),
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
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  }
}
