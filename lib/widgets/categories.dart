import 'dart:convert';
import 'package:sambapos_desktop/model/contextExtension.dart';
import 'package:flutter/material.dart';
import 'package:sambapos_desktop/view/breakfast_products.dart';
import 'package:sambapos_desktop/view/burgers_product.dart';
import 'package:sambapos_desktop/view/dessert_products.dart';
import 'package:sambapos_desktop/view/products.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.4),
      child: Container(
        child: Center(
          child: ListView(
            children: [
              button(
                url:
                    "https://i.nefisyemektarifleri.com/2019/08/28/burger-king-menu-fiyatlari-2019-guncel-listesi.jpg",
                text: "COMBOS",
                navigator: Products(),
              ),
              button(
                url:
                    "https://cdn.yemek.com/mncrop/940/625/uploads/2016/05/ev-yapimi-hamburger.jpg",
                text: "BURGERS",
                navigator: Products2(),
              ),
              button(
                url:
                    "https://i.pstimaj.com/img/78/740x0/5e2c2af5ae298bebc9189a9e.jpg",
                text: "BREAKFAST",
                navigator: Products3(),
              ),
              button(
                url:
                    "https://img.bestrecipes.com.au/5I9gvKf8/br/2018/09/no-bake-lindt-ball-cheesecake-recipe-523707-1.jpg",
                text: "DESSERTS",
                navigator: Products4(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class button extends StatelessWidget {
  final url;
  final text;
  final navigator;
  const button({
    this.text,
    this.url,
    this.navigator,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigator));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              url,
              fit: BoxFit.cover,
            ),
            Center(child: Text(text))
          ],
        ),
      ),
    );
  }
}
