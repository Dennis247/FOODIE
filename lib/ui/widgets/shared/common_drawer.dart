import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/ui/pages/membership.dart';
import 'package:foodie/ui/pages/profilepage.dart';
import 'package:foodie/utils/const.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Pawan Kumar",
            ),
            accountEmail: Text(
              "Dennis",
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage(Constants.logoUrl),
            ),
          ),
          new ListTile(
            title: Text(
              "Our MemberShip Plan",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
            ),
            leading: Icon(
              Icons.card_membership,
              color: Colors.green,
            ),
            onTap: () {
              //  Navigator.pushReplacementNamed(context, '/trucks');
              Navigator.popAndPushNamed(context, MemberShipPage.routeName);
            },
          ),
          // Divider(),
          // new ListTile(
          //   title: Text(
          //     "Settings",
          //     style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
          //   ),
          //   leading: Icon(
          //     Icons.settings,
          //     color: Colors.purple,
          //   ),
          //   onTap: () {
          //     //  Navigator.pushReplacementNamed(context, '/trucks');
          //     Navigator.popAndPushNamed(context, ProfilePage.routeName);
          //   },
          // ),
          Divider(),
          new ListTile(
            title: Text(
              "My Profile",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
            ),
            leading: Icon(
              FontAwesomeIcons.user,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, ProfilePage.routeName);
            },
          ),
          Divider(),
          new ListTile(
            title: Text(
              "Log Out",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
            ),
            leading: Icon(
              FontAwesomeIcons.lock,
              color: Colors.deepOrange,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
