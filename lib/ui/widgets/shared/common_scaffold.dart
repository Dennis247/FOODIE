import 'package:flutter/material.dart';

import 'common_drawer.dart';

class CommonScaffold extends StatelessWidget {
  final appTitle;
  final Widget bodyData;
  final showFAB;
  final showDrawer;
  final backGroundColor;
  final scaffoldKey;
  final showBottomNav;
  final floatingIcon;
  final centerDocked;
  final elevation;

  CommonScaffold({
    this.appTitle,
    this.bodyData,
    this.showFAB = false,
    this.showDrawer = false,
    this.backGroundColor,
    this.scaffoldKey,
    this.showBottomNav = false,
    this.centerDocked = false,
    this.floatingIcon,
    this.elevation = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey != null ? scaffoldKey : null,
      backgroundColor: backGroundColor != null ? backGroundColor : null,
      appBar: AppBar(
        elevation: elevation,
        backgroundColor: Colors.black,
        title: Text(appTitle),
        actions: <Widget>[
          SizedBox(
            width: 5.0,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: showDrawer ? CommonDrawer() : null,
      body: bodyData,
    );
  }
}
