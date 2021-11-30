import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Food Delivery'),
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.account_circle_sharp),
          iconSize: 30.0,
        ),
        actions: [
          TextButton(
              onPressed: (){},
              child: Text(
                  'cart (${currentUser.cart.length})',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),
              )
          )
        ],

      ),
    );
  }
}
