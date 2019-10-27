import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static final String path = "lib/src/pages/blog/article2.dart";
  @override
  Widget build(BuildContext context) {
    String image = "assets/images/tarts-banner.jpg";
    return Scaffold(
      appBar: AppBar(
          elevation: 3.0,
          title: Text("ABOUT US"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "TEAS TARTS & TINGS",
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(height: 10.0),
                    Divider(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Welcome to Butterfish & Bread! We’re Brooklyn’s newest restaurant and catering experience. Butterfish is a symbol of the fresh food and healthy good life found in the Paradise of the Caribbean. The youth say, “butta”—it’s that good, smooth and sweet— a way to declare love and life is good.  Delicious food you can eat with confidence is always good. Eat In or Take Out your family’s meal. Or Call, Order and get Lunch or Dinner Delivered. ",
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "It is said that bread is the staff of life, and we assert butterfish is the staff of sea life. They are both heavenly gifts to support health and lifestyle choices. We offer free bread with our meals. And you can order our real, wild-caught butterfish from Guyana any way you’d like it. We also sell herbs, herbal teas and immune-building shots of herb essences to complement your meals.",
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
