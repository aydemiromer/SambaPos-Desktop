import 'package:flutter/material.dart';
import 'package:sambapos_desktop/model/contextExtension.dart';


class FirstPageUi extends StatefulWidget {
  @override
  _FirstPageUiState createState() => _FirstPageUiState();
}

class _FirstPageUiState extends State<FirstPageUi> {
  final textTop = "Take Out or Dine In ?";
  final textleftButton = "DINE IN";
  final textrightButton = "TAKE OUT";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(textTop),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.restaurant),
                      label: Text(textleftButton)),
                  SizedBox(
                    width: context.dynamicWeight(0.2),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_bag),
                      label: Text("TAKE OUT")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
