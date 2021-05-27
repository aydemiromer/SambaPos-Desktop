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
  bool checkBoxValue = false;
  bool checkBoxCola = false;
  bool checkBoxFries = false;
  bool checkBoxOnion = false;
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
                        crossAxisCount: 3, childAspectRatio: 1.5 / 1.6),
                    itemCount: mydata == null ? 0 : mydata.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return AlertDialog(
                                      title: Text(
                                        "" + mydata[index]['name'],
                                      ),
                                      content: Form(
                                          child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            "" + mydata[index]['photo'],
                                            height: 200,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Price"),
                                          SizedBox(
                                            height: 10,
                                            width: 200,
                                            child: Divider(
                                              thickness: 1,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            "Normal     " +
                                                mydata[index]['price'],
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                          Row(
                                            children: [
                                              Text("Extra Cheese"),
                                              Checkbox(
                                                  value: checkBoxValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      checkBoxValue = value;
                                                    });
                                                  }),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Cola"),
                                              Checkbox(
                                                  value: checkBoxCola,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      checkBoxCola = value;
                                                    });
                                                  }),
                                              Text("Fanta"),
                                              Checkbox(
                                                  value: checkBoxCola,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      checkBoxCola = value;
                                                    });
                                                  }),
                                              Text("Sprite"),
                                              Checkbox(
                                                  value: checkBoxCola,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      checkBoxCola = value;
                                                    });
                                                  }),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("French fries +1"),
                                              Checkbox(
                                                  value: checkBoxFries,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      checkBoxFries = value;
                                                    });
                                                  }),
                                              Text("Onion Rings"),
                                              Checkbox(
                                                  value: checkBoxOnion,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      checkBoxOnion = value;
                                                    });
                                                  }),
                                            ],
                                          ),
                                        ],
                                      )),
                                      actions: [
                                        IconButton(
                                            icon: Icon(
                                              Icons.shopping_cart,
                                              color: Colors.green,
                                            ),
                                            onPressed: null)
                                      ],
                                    );
                                  });
                                });
                          },
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Image.network(
                                  "" + mydata[index]['photo'],
                                  height: 200,
                                ),
                                Center(
                                    child: Text(
                                  "" + mydata[index]['name'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
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
