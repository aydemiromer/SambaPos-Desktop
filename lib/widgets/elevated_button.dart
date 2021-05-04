import 'package:flutter/material.dart';
import 'package:sambapos_desktop/model/contextExtension.dart';

class ExpandedButton extends StatelessWidget {
  const ExpandedButton({
    Key key,
    @required this.buttonColor,
    @required this.textPosition,
    @required this.icon,
    @required this.onpressed,
  }) : super(key: key);

  final Color buttonColor;
  final String textPosition;
  final IconData icon;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => onpressed));
          },
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
          ),
          child: Padding(
            padding: context.paddingAllow,
            child: Column(
              children: [
                Icon(
                  icon,
                  color: Colors.black,
                ),
                Text(
                  textPosition,
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          )),
    );
  }
}
