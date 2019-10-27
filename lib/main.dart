import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie/ui/pages/authentication/sign_in_page.dart';
import 'package:foodie/ui/pages/authentication/sign_up_page.dart';
import 'package:foodie/ui/pages/mainpage.dart';
import 'package:foodie/ui/pages/membership.dart';
import 'package:foodie/ui/pages/profilepage.dart';
import 'package:foodie/utils/const.dart';
import 'ui/pages/homepage.dart';

void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: isDark ? Constants.darkTheme : Constants.lightTheme,
      home: SignInPage(),
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SignInPage.routeName: (context) => SignInPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
        MainPage.routeName: (context) => MainPage(),
        ProfilePage.routeName: (context) => ProfilePage(),

        //  CategoryPage.routeName: (context) => CategoryPage(),
        MemberShipPage.routeName: (context) => MemberShipPage()
      },
    );
  }
}
