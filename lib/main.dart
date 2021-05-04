import 'package:flutter/material.dart';
import 'package:sambapos_desktop/view/view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPageUi(),
    );
  }
}
