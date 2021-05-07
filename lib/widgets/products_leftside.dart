import 'dart:convert';
import 'package:sambapos_desktop/model/contextExtension.dart';
import 'package:flutter/material.dart';

class LeftSide extends StatefulWidget {
  @override
  _LeftSideState createState() => _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.4),
      child: Container(
        child: Center(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/foods/categories.json'),
              builder: (context, snapshot) {
                var mydata = jsonDecode(snapshot.data.toString());

                return ListView.builder(
                    itemCount: mydata == null ? 0 : mydata.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: () {},
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Image.network(
                                  "" + mydata[index]['photo'],
                                  fit: BoxFit.cover,
                                ),
                                Center(child: Text("" + mydata[index]['name']))
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
