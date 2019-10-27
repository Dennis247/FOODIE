import 'package:flutter/material.dart';
import 'package:foodie/data/order.dart';
import 'package:foodie/model/order.dart';
import 'package:foodie/ui/widgets/order.dart';
import 'package:foodie/ui/widgets/shared/common_drawer.dart';
import 'package:foodie/utils/const.dart';

class OrderPage extends StatefulWidget {
  static String routeName = "OrderPage";

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final List<Map> items = [
    {
      "image": "assets/food/breakfast.jpg",
      "title": "Breakfast Set",
      "price": 20
    },
    {"image": "assets/food/burger.jpg", "title": "Veg Burger", "price": 30},
  ];

  @override
  Widget build(BuildContext context) {
    final String _customerId = "1";
    List<Order> _allOrders = Order.ordersFromJson(orders);
    List<Order> _customerOrder = _allOrders
        .where((Order order) =>
            order.customerId == _customerId && order.isDelivered == false)
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 6.0,
        title: Text(
          "CHECK OUT",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16.0),
                itemCount: _customerOrder.length,
                itemBuilder: (BuildContext context, int index) {
                  return OrderItem(
                      _customerOrder[index], _customerOrder[index].foodOrdered);
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Subtotal      \$50",
                    style:
                        TextStyle(color: Colors.grey.shade700, fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Delivery       \$05",
                    style:
                        TextStyle(color: Colors.grey.shade700, fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Cart Subtotal     \$55",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      height: 50.0,
                      color: Colors.green,
                      child: Text(
                        "Secure Checkout".toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
