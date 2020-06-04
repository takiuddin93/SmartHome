import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarthome/main.dart';
import 'package:smarthome/pages/login.dart';
import 'package:smarthome/pages/dashboard.dart';

import 'package:smarthome/utils/hexagon_button.dart';

Color mediumspringgreen = Color(0xFF26D07C);
Color creamywhite = Color(0xFFF5F5F1);

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Signup());
}

class Urls {
  static const BASE_API_URL = "http://192.168.0.100:3000";
}

class Signup extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignupPage(title: 'Sign Up'),
    );
  }
}

class SignupPage extends StatefulWidget {
  SignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String username, password;
  PageController _controller = new PageController(initialPage: 1, viewportFraction: 1.0);
  bool _isLoading = false;
  TextEditingController _firstController = new TextEditingController();
  TextEditingController _lastController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/login_signup_background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,//(0xFF26D07C),
            elevation: 0.0,
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(Icons.menu, color: Color(0xFF465062)),
            //     onPressed: () {},
            //   ),
            // ],
            leading: IconButton(
              icon:Icon(Icons.arrow_back),
              color: mediumspringgreen,
              onPressed:() => {
                Navigator.of(context)
                    .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new HomePage();
                }))
              }
            )
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            height: media.height,
            width: media.width,
            child: Stack(
              children: <Widget>[
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding: EdgeInsets.only(top: 72.0),
                    child: Center(
                      child: Image.asset(
                        "assets/images/smarthome_icon.png",
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.only(top: 168.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Lets get started!",
                          style: TextStyle(
                            color: mediumspringgreen,
                            fontSize: 28.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  width: media.width,
                  child: Container(
                    padding: EdgeInsets.only(top: 204.0, left: 36, right: 36),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Create an account to gain access to",
                          style: TextStyle(
                            color: mediumspringgreen,
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  width: media.width,
                  child: Container(
                    padding: EdgeInsets.only(top: 228.0, left: 36, right: 36),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "your dashboard",
                          style: TextStyle(
                            color: mediumspringgreen,
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // full name
                Positioned(
                  width: media.width,
                  child: Container (
                    padding: EdgeInsets.only(top: 280.0, left: 48.0, right: 48.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F1),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          new BoxShadow(
                            color: Color(0x29000000),
                            offset: new Offset(0.0, 4.0),
                            blurRadius: 8.0
                          )
                        ],
                      ),
                      child: Center(
                        child: Column(
                          children : [
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                // labelText: "full name",
                                hintText: "full name",
                                fillColor: Colors.transparent,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: mediumspringgreen),
                                ),
                              ),
                              validator: (val) {
                                if(val.length==0) {
                                  return "full name cannot be empty";
                                }else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ]
                        )
                      ),
                    )
                  )
                ),
                //email
                Positioned(
                  width: media.width,
                  child: Container (
                    padding: EdgeInsets.only(top: 360.0, left: 48.0, right: 48.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F1),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          new BoxShadow(
                            color: Color(0x29000000),
                            offset: new Offset(0.0, 4.0),
                            blurRadius: 8.0
                          )
                        ],
                      ),
                      child: Center(
                        child: Column(
                          children : [
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.mail),
                                // labelText: "email",
                                hintText: "email",
                                fillColor: Colors.transparent,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: mediumspringgreen),
                                ),
                              ),
                              validator: (val) {
                                if(val.length==0) {
                                  return "email cannot be empty";
                                }else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ]
                        )
                      ),
                    )
                  )
                ),
                // password
                Positioned(
                  width: media.width,
                  child: Container (
                    padding: EdgeInsets.only(top: 440.0, left: 48.0, right: 48.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F1),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          new BoxShadow(
                            color: Color(0x29000000),
                            offset: new Offset(0.0, 4.0),
                            blurRadius: 8.0
                          )
                        ],
                      ),
                      child: Center(
                        child: Column(
                          children : [
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                // labelText: "password",
                                hintText: "password",
                                fillColor: Colors.transparent,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: mediumspringgreen),
                                ),
                              ),
                              validator: (val) {
                                if(val.length==0) {
                                  return "password cannot be empty";
                                }else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ]
                        )
                      ),
                    )
                  )
                ),
                // // forgot password
                // Positioned(
                //   child: Container(
                //     padding: EdgeInsets.only(top: 584.0, right: 48.0),
                //     child: new Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: <Widget>[
                //         Text(
                //           "Forgot your password?",
                //           style: TextStyle(
                //             color: mediumspringgreen,
                //             fontSize: 16.0,
                //             fontFamily: 'Poppins',
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // Submit Button
                Positioned(
                  top: 648,
                  left: media.width - 128,
                  width: 64,
                  child: GestureDetector(
                    child: Container(
                      height: 72.0,
                      width: 80.95,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          image:AssetImage('assets/images/submit_button.png'),
                          fit:BoxFit.cover
                        ),
                        boxShadow: [
                          new BoxShadow(
                            color: Color(0x29000000),
                            offset: new Offset(0.0, 4.0),
                            blurRadius: 16.0
                          )
                        ],
                      )
                    ),
                    onTap:(){
                      gotoDashboard();
                    }
                  )
                ),
                // Bottom Text
                Positioned(
                  child: Container(
                    padding: EdgeInsets.only(top: 744.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: mediumspringgreen,
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            gotoLogin();
                          },
                          child: Text(
                            " Login",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  gotoLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Login();
    }));
  }
  gotoDashboard() {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Dashboard();
    }));
  }
}
