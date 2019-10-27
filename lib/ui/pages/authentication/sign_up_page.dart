import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/authentication/sign_in_page.dart';
import 'package:foodie/ui/pages/mainpage.dart';

class SignUpPage extends StatefulWidget {
  static String routeName = "SignUpPage";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final String background = "assets/images/homepage.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(background), fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.black.withOpacity(0.7),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                    ),
                    Text(
                      "CREATE NEW ACCOUNT",
                      style: TextStyle(color: Colors.white, fontSize: 28.0),
                    ),
                    Text(
                      "sign up to continue",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54))),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        child: Text(
                          "SIGN UP".toUpperCase(),
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, MainPage.routeName);
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an Account?",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SignInPage.routeName);
                          },
                          child: Text(
                            "LOGIN",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:foodie/ui/pages/mainpage.dart';
// import 'package:foodie/ui/pages/sign_in_page.dart';

// import 'package:foodie/utils/const.dart';

// class SignUpPage extends StatefulWidget {
//   static String routeName = "SignUpPage";

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   // bool _toggleVisibility = true;
//   final TextEditingController _usernameController = new TextEditingController();
//   final TextEditingController _emailController = new TextEditingController();
//   final TextEditingController _passwordController = new TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   Widget _buildUserNameField() {
//     return ListTile(
//         title: TextFormField(
//       style: TextStyle(color: Colors.black),
//       keyboardType: TextInputType.text,
//       controller: _usernameController,
//       // ignore: missing_return
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'username cannot be empty';
//         }
//       },
//       decoration: InputDecoration(
//           hintText: "User Name:",
//           hintStyle: TextStyle(color: Colors.black45),
//           border: InputBorder.none,
//           icon: Icon(
//             FontAwesomeIcons.user,
//             color: Colors.deepOrange,
//           )),
//     ));
//   }

//   Widget _buildUserEmailField() {
//     return ListTile(
//         title: TextFormField(
//       style: TextStyle(color: Colors.black),
//       keyboardType: TextInputType.emailAddress,
//       controller: _emailController,
//       // ignore: missing_return
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'email cannot be empty';
//         }
//       },
//       decoration: InputDecoration(
//           hintText: "Email:",
//           hintStyle: TextStyle(color: Colors.black45),
//           border: InputBorder.none,
//           icon: Icon(
//             Icons.email,
//             color: Colors.deepOrange,
//           )),
//     ));
//   }

//   Widget _buildPasswordField() {
//     return ListTile(
//         title: TextFormField(
//       keyboardType: TextInputType.text,
//       controller: _passwordController,
//       // ignore: missing_return
//       validator: (String value) {
//         if (value.isEmpty || value.length < 4) {
//           return 'password length cannot be less than four';
//         }
//       },
//       style: TextStyle(color: Colors.black),
//       obscureText: true,
//       // controller: _passwordTextController,
//       decoration: InputDecoration(
//           hintText: "Password:",
//           hintStyle: TextStyle(color: Colors.black45),
//           border: InputBorder.none,
//           icon: Icon(
//             Icons.lock,
//             color: Colors.deepOrange,
//           )),
//     ));
//   }

//   Widget _buildConfirmPassword() {
//     return ListTile(
//         title: TextFormField(
//       style: TextStyle(color: Colors.black),
//       obscureText: true,
//       keyboardType: TextInputType.visiblePassword,
//       //   controller: _usernameController,
//       // ignore: missing_return
//       validator: (String value) {
//         if (_passwordController.text != value) {
//           return 'Password Do Not Match';
//         }
//       },
//       decoration: InputDecoration(
//           hintText: "Confirm Password:",
//           hintStyle: TextStyle(color: Colors.black45),
//           border: InputBorder.none,
//           icon: Icon(
//             Icons.lock,
//             color: Colors.deepOrange,
//           )),
//     ));
//   }

//   Widget _buildSignUpButton(BuildContext context) {
//     return Container(
//       width: 175,
//       height: 40,
//       child: RaisedButton(
//         elevation: 5.0,
//         onPressed: () async {
//           if (!_formKey.currentState.validate()) {
//             return;
//           } else {
//             Navigator.pushNamed(context, MainPage.routeName);
//           }
//         },
//         color: Constants.darkPrimary,
//         child: Text(
//           'Sign Up',
//           style: TextStyle(
//               color: Constants.lightPrimary,
//               fontSize: Constants.buttonFontSize),
//         ),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(Constants.buttonCurveSize)),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double deviceWidth = MediaQuery.of(context).size.width;
//     final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Container(
//             width: targetWidth,
//             child: Form(
//               key: _formKey,
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       CircleAvatar(
//                         minRadius: 60,
//                         backgroundColor: Colors.deepOrange,
//                         child: Icon(
//                           Icons.card_giftcard,
//                           size: 45.0,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.05,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           Text(
//                             "Forgotten Password?",
//                             style: TextStyle(
//                               fontSize: 14.0,
//                               color: Constants.darkAccent,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       Card(
//                         elevation: 5.0,
//                         child: Padding(
//                           padding: EdgeInsets.all(20.0),
//                           child: Column(
//                             children: <Widget>[
//                               _buildUserNameField(),
//                               Divider(
//                                 color: Colors.grey.shade600,
//                               ),
//                               _buildUserEmailField(),
//                               Divider(color: Colors.grey.shade600),
//                               _buildPasswordField(),
//                               Divider(
//                                 color: Colors.grey.shade600,
//                               ),
//                               _buildConfirmPassword(),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.05,
//                       ),
//                       _buildSignUpButton(context),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             "Already have an account?",
//                             style: TextStyle(
//                                 color: Constants.lightAccent, fontSize: 14.0),
//                           ),
//                           SizedBox(width: 10.0),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamed(
//                                   context, SignInPage.routeName);
//                             },
//                             child: Text(
//                               "Sign In",
//                               style: TextStyle(
//                                   color: Constants.darkPrimary, fontSize: 16.0),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
