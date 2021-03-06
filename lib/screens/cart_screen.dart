import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart (${currentUser.cart.length})'),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index < currentUser.cart.length) {
              Order order = currentUser.cart[index];
              return _buildOrder(order);
            }
            return Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Estimated Delivery Time:',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                      Text('25 min',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Cost',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600)),
                      Text('\$ ${totalPrice().toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.green[700]))
                    ],
                  ),
                  SizedBox(height: 88.0,)
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
                thickness: 2.0,
                height: 2.0,
                color: Colors.grey,
              ),
          itemCount: currentUser.cart.length + 1),
      bottomSheet: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
          BoxShadow(
              offset: Offset(0, 1), color: Colors.black26, blurRadius: 6.0),
        ]),
        child: FlatButton(
          onPressed: () {  },
        child: Text('CHECKOUT',style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,letterSpacing: 2.0,color: Colors.white),),)
      ),
    );
  }

  double totalPrice() {
    double totalPrice = 0;
    currentUser.cart.forEach((Order order) {
      totalPrice += order.quantity * order.food.price;
    });
    return totalPrice;
  }

  Widget _buildOrder(Order order) {
    return Container(
      height: 170.0,
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            order.food.imageUrl,
                          ))),
                ),
                Container(
                  margin: EdgeInsets.all(12.0),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(order.restaurant.name,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border:
                                Border.all(color: Colors.black54, width: 1.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text(
                                order.quantity.toString(),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(8.0),
              child: Text(
                '\$ ${order.food.price.toString()}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
