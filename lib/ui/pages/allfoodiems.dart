import 'package:flutter/material.dart';
import 'package:foodie/data/food.dart';
import 'package:foodie/model/food.dart';
import 'package:foodie/ui/widgets/food.dart';
import 'package:foodie/ui/widgets/shared/common_cart.dart';
import 'package:foodie/utils/debouncer.dart';

class AllFoodItemsPage extends StatefulWidget {
  @override
  _AllFoodItemsPageState createState() => _AllFoodItemsPageState();
}

class _AllFoodItemsPageState extends State<AllFoodItemsPage> {
  List<Food> _allfoods;
  List<Food> _filteredfoods;
  final _debouncer = Debouncer(milliseconds: 500);
  final TextEditingController _searchControl = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _allfoods = Food.foodsFromJson(foods);
    _filteredfoods = _allfoods;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[CartItem("6")],
        elevation: 0.0,
        title: Text("IN STORE"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 6.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Search..",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black87,
                    ),
                    suffixIcon: Icon(
                      Icons.filter_list,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 1,
                  controller: _searchControl,
                  onChanged: (string) {
                    _debouncer.run(() {
                      setState(() {
                        _filteredfoods = _allfoods
                            .where((f) => (f.name
                                    .toLowerCase()
                                    .contains(string.toLowerCase()) ||
                                f.description
                                    .toLowerCase()
                                    .contains(string.toLowerCase()) ||
                                f.price
                                    .toString()
                                    .toLowerCase()
                                    .contains(string.toLowerCase()) ||
                                f.rating
                                    .toLowerCase()
                                    .contains(string.toLowerCase())))
                            .toList();
                      });
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _filteredfoods.length,
              itemBuilder: (BuildContext context, int index) {
                Food food = _filteredfoods[index];

                return FoodItem(food);
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
