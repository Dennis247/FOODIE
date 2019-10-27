import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/order/orderpage.dart';

class CartItem extends StatefulWidget {
  final String count;
  CartItem(this.count);
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
          height: 150.0,
          width: 30.0,
          child: new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => OrderPage()));
            },
            child: new Stack(
              children: <Widget>[
                new IconButton(
                  icon: new Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: null,
                ),
                // list.length ==0 ? new Container() :
                new Positioned(
                    child: new Stack(
                  children: <Widget>[
                    new Icon(Icons.brightness_1,
                        size: 25.0, color: Colors.green[800]),
                    new Positioned(
                        top: 6.0,
                        right: 8.0,
                        child: new Center(
                          child: new Text(
                            "5",
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                )),
              ],
            ),
          )),
    );
  }
}
