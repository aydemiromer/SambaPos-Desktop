import 'package:flutter/material.dart';
import 'package:sambapos_desktop/model/contextExtension.dart';

class Products extends StatelessWidget {
  const Products({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LeftSide(),
        RightSide(),
      ],
    );
  }
}

class LeftSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.3),
      child: Container(
        color: Colors.yellow,
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Card(
                child: Text("data"),
              ),
            ),
            SizedBox(
              height: 250,
              child: Card(
                child: Text("data"),
              ),
            ),
            SizedBox(
              height: 250,
              child: Card(
                child: Text("data"),
              ),
            ),
            Card(
              child: Text("data"),
            ),
            Card(
              child: Text("data"),
            ),
            Card(
              child: Text("data"),
            ),
            Card(
              child: Text("data"),
            )
          ],
        ),
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Text("data"),
      ),
    );
  }
}
