import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/ui/widgets/shared/common_cart.dart';

class ProfilePage extends StatefulWidget {
  static final String routeName = "ProfilePage";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepOrange,
      appBar: AppBar(
          centerTitle: true,
          elevation: 6.0,
          title: Text(
            "PROFILE",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          )),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      minRadius: 60,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        // backgroundImage: CachedNetworkImageProvider(images[0]),
                        child: Icon(
                          FontAwesomeIcons.user,
                          color: Colors.white,
                          size: 40,
                        ),
                        backgroundColor: Colors.black,
                        minRadius: 50,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Ram Kumar",
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                title: Text(
                  "Email",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 14.0),
                ),
                subtitle: Text(
                  "ram@kumar.com",
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                trailing: Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
              Divider(),
              ListTile(
                  title: Text(
                    "Phone",
                    style: TextStyle(color: Colors.deepOrange, fontSize: 14.0),
                  ),
                  subtitle: Text(
                    "+977 9818225533",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: Colors.green,
                  )),
              Divider(),
              ListTile(
                  title: Text(
                    "Password",
                    style: TextStyle(color: Colors.deepOrange, fontSize: 14.0),
                  ),
                  subtitle: Text(
                    "*******",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: Colors.green,
                  )),
              Divider(),
              ListTile(
                  title: Text(
                    "Address",
                    style: TextStyle(color: Colors.deepOrange, fontSize: 14.0),
                  ),
                  subtitle: Text(
                    "56 brrokylyn heights USA BB4677",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: Colors.green,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
