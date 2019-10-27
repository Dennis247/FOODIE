import 'package:flutter/material.dart';
import 'package:foodie/model/food.dart';
import 'package:foodie/model/order.dart';
import 'package:foodie/utils/const.dart';

class OrderItem extends StatelessWidget {
  final Order orderedItem;
  final Food foodOrdered;

  OrderItem(this.orderedItem, this.foodOrdered);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 30.0, bottom: 10.0),
          child: Material(
            borderRadius: BorderRadius.circular(5.0),
            elevation: 3.0,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 80,
                    child: Image.asset(foodOrdered.img),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          foodOrdered.name,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "\$${foodOrdered.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 15,
          child: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              padding: EdgeInsets.all(0.0),
              color: Colors.deepOrange,
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
