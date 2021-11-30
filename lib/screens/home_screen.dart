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


      body: ListView(
        children: [
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              fillColor: Colors.white,
              hintText: 'Search for food or Restaurants',
              prefixIcon: Icon(
                Icons.search,
                size: 30.0,
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: (){},
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(width: 0.8)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      width: 0.8,
                      color: Theme.of(context).primaryColor,
                  ),

              )
            ),
          )
        ],
      ),
    );
  }
}
