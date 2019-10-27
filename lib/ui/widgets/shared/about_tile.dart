import 'package:flutter/material.dart';
import 'package:foodie/utils/const.dart';

class MyAboutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      applicationIcon:
          CircleAvatar(backgroundImage: new AssetImage(Constants.logoUrl)),
      icon: CircleAvatar(backgroundImage: new AssetImage(Constants.logoUrl)),
      aboutBoxChildren: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Dennis",
        ),
        Text(
          "MTechViral",
        ),
      ],
      applicationName: Constants.appName,
      applicationVersion: "1.0.1",
      applicationLegalese: "Apache License 2.0",
    );
  }
}
