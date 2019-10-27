import 'package:flutter/material.dart';
import 'package:foodie/model/food.dart';
import 'package:foodie/ui/widgets/shared/common_cart.dart';
import 'package:foodie/utils/const.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  FoodDetailsPage(this.food);
  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantity = 1;
  Widget buildFoodFooditem() {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 2.0,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        "${widget.food.img}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 6.0,
                    right: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Constants.ratingBG,
                              size: 10,
                            ),
                            Text(
                              " ${widget.food.rating} ",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 6.0,
                      left: 6.0,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0)),
                          child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "\$ ${widget.food.price}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              )))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuantity() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  }),
              Text(
                quantity.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              IconButton(
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      quantity = --quantity == 0 ? 1 : quantity;
                    });
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDescription() {
    return ListTile(
        title: Text(
          "${widget.food.name}",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.left,
        ),
        subtitle: Text(
          widget.food.description,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }

  Widget buildBuyRow() {
    return Container(
      color: Colors.deepOrange,
      margin: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Expanded(
              child: MaterialButton(
                  onPressed: () {},
                  color: Constants.darkAccent,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text("Add Cart"))),
          IconButton(
              icon: Icon(Icons.add_shopping_cart),
              color: Colors.pink,
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget buildAddToRow() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Constants.darkPrimary,
              child: RaisedButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Constants.darkPrimary,
                onPressed: null,
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
                label: Text(
                  "ADD TO CART",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            flex: 3,
          ),
          Expanded(
              child: Container(
//            margin: EdgeInsets.only(left: 30, right: 20),
            decoration:
                ShapeDecoration(shape: CircleBorder(), color: Colors.green),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            padding: EdgeInsets.all(12),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(widget.food.name),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          actions: <Widget>[CartItem("6")]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildAddToRow(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: buildFoodFooditem(),
            ),
            buildQuantity(),
            buildDescription(),
          ],
        ),
      ),
    );
  }
}
