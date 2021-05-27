import 'package:flutter/material.dart';
import 'dart:io';
import 'package:sambapos_desktop/constant/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sambapos_desktop/view/payment_method.dart';
import 'package:sambapos_desktop/view/view.dart';
import 'package:sambapos_desktop/widgets/categories.dart';
import 'dart:convert';
import 'package:sambapos_desktop/model/contextExtension.dart';

class Products3 extends StatefulWidget {
  const Products3({Key key}) : super(key: key);

  @override
  _Products3State createState() => _Products3State();
}

class _Products3State extends State<Products3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyFirstBottomNavbar(),
      body: Row(
        children: [
          Categories(),
          RightSide(),
        ],
      ),
    );
  }
}

class MyFirstBottomNavbar extends StatelessWidget {
  const MyFirstBottomNavbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentMethod()));
              }),
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstPageUi()));
              }),
          IconButton(
              icon: Icon(
                Icons.language,
                color: Colors.grey,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              context.locale = AppConstant.GB_LOCALE;
                            },
                            child: Column(
                              children: [
                                Icon(Icons.language),
                                Text("EN-UK"),
                              ],
                            )),
                        ElevatedButton(
                            onPressed: () {
                              context.locale = AppConstant.EN_LOCALE;
                            },
                            child: Column(
                              children: [
                                Icon(Icons.language),
                                Text("EN-US"),
                              ],
                            )),
                        ElevatedButton(
                            onPressed: () {
                              context.locale = AppConstant.TR_LOCALE;
                            },
                            child: Column(
                              children: [
                                Icon(Icons.language),
                                Text("TR"),
                              ],
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentMethod()));
                            },
                            child: Text("Ok"))
                      ],
                    );
                  },
                );
              }),
          IconButton(icon: Icon(Icons.fullscreen_exit), onPressed: null),
          IconButton(icon: Icon(Icons.settings), onPressed: null),
          IconButton(
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.grey,
              ),
              onPressed: () {
                exit(0);
              }),
        ],
      ),
    );
  }
}

class RightSide extends StatefulWidget {
  const RightSide({Key key}) : super(key: key);

  @override
  _RightSideState createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  bool checkBoxValue = false;
  bool value;
  Function onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.6),
      child: Container(
        child: Center(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/foods/breakfast.json'),
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
                                      title: Text("" + mydata[index]['name']),
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
                                              Text("Cheese"),
                                              Checkbox(
                                                  value: checkBoxValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      checkBoxValue = value;
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
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                                Center(
                                    child: Text("" + mydata[index]['price'])),
                                /*Checkbox(
                                    value: checkBoxValue,
                                    onChanged: (value) {
                                      setState(() {
                                        checkBoxValue = value;
                                      });
                                    })*/
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
