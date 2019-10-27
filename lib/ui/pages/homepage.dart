import 'package:flutter/material.dart';
import 'package:foodie/data/categories.dart';
import 'package:foodie/data/food.dart';
import 'package:foodie/model/category.dart';
import 'package:foodie/model/food.dart';
import 'package:foodie/ui/pages/allfoodiems.dart';
import 'package:foodie/ui/widgets/category_item.dart';
import 'package:foodie/ui/widgets/favourite_item.dart';
import 'package:foodie/ui/widgets/shared/common_cart.dart';
import 'package:foodie/ui/widgets/shared/common_drawer.dart';

class HomePage extends StatefulWidget {
  static String routeName = "HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
//  final TextEditingController _searchControl = new TextEditingController();
  List<Food> _favouriteFoods = Food.foodsFromJson(foods);
  List<Category> _categories = Category.categoryFromJson(categories);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[CartItem("6")],
        elevation: 6.0,
        title: Text(
          "TEA TARTS AND TINGS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: CommonDrawer(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Favourite",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                FlatButton(
                  child: Text(
                    "See all food items (43)",
                    style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return AllFoodItemsPage();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height / 2.4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: foods == null ? 0 : _favouriteFoods.length,
                itemBuilder: (BuildContext context, int index) {
                  Food food = _favouriteFoods[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: FavouriteItem(food),
                  );
                },
              ),
            ),

            SizedBox(height: 30.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height / 6,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories == null ? 0 : _categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryItem(_categories[index]);
                },
              ),
            ),

            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
