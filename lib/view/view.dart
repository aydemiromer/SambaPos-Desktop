import 'package:flutter/material.dart';
import 'package:sambapos_desktop/model/contextExtension.dart';
import 'package:sambapos_desktop/view/payment_method.dart';

class FirstPageUi extends StatefulWidget {
  @override
  _FirstPageUiState createState() => _FirstPageUiState();
}

class _FirstPageUiState extends State<FirstPageUi> {
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
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.language,
                color: Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.grey,
              ),
              label: '',
            ),
          ],
        ),
        //backgroundColor: Colors.blueGrey,
        // bottomNavigationBar: MyStatefulWidget(),
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
                Padding(
                  padding: context.paddingAllow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return PaymentMethod();
                                }),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: buttonColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.restaurant,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    textleftButton,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: context.dynamicHeight(0.01),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        width: context.dynamicWidth(0.01),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return PaymentMethod();
                                }),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: buttonColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.shopping_bag,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    textrightButton,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: context.dynamicHeight(0.01),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
