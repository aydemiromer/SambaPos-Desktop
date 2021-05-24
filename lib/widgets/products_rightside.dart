import 'dart:convert';
import 'package:sambapos_desktop/model/contextExtension.dart';
import 'package:flutter/material.dart';

//Yapılacaklar
// Listelemin ürünlerin kategorisine göre gelmesi gerekiyor!
class RightSide extends StatefulWidget {
  const RightSide({Key key}) : super(key: key);

  @override
  _RightSideState createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.6),
      child: Container(
        child: Center(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/foods/foods.json'),
              builder: (context, snapshot) {
                var mydata = jsonDecode(snapshot.data.toString());

                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 1.5 / 2),
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
                                  height: 200,
                                ),
                                Center(child: Text("" + mydata[index]['name'])),
                                Center(child: Text("" + mydata[index]['price']))
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
