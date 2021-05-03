import 'package:flutter/material.dart';
import 'package:sambapos_desktop/model/contextExtension.dart';

class PaymentMethod extends StatefulWidget {
  PaymentMethod({Key key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
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
        //backgroundColor: Colors.blueGrey,

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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: buttonColor,
                            ),
                            child: Padding(
                              padding: context.paddingAllow,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.local_atm,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    textleftButton,
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        width: context.dynamicWidth(0.01),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: buttonColor,
                            ),
                            child: Padding(
                              padding: context.paddingAllow,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    textmidButton,
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        width: context.dynamicWidth(0.01),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: buttonColor,
                            ),
                            child: Padding(
                              padding: context.paddingAllow,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.qr_code,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    textrightButton,
                                    style: TextStyle(color: Colors.black),
                                  )
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
