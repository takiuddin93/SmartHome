import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarthome/pages/dashboard.dart';
import 'package:smarthome/pages/signup.dart';

Color mediumspringgreen = Color(0xFF26D07C);
Color creamywhite = Color(0xFFF5F5F1);

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Login());
}

class Urls {
  static const BASE_API_URL = "http://192.168.0.100:3000";
}

class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Login'),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username, password;
  PageController _controller = new PageController(initialPage: 1, viewportFraction: 1.0);
  bool _isLoading = false;
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
          backgroundColor: Colors.transparent,
          body: Container(
            height: media.height,
            width: media.width,
            child: Stack(
              children: <Widget>[
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding: EdgeInsets.only(top: 128.0),
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
                    padding: EdgeInsets.only(top: 224.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Welcome!",
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
                    padding: EdgeInsets.only(top: 260.0, left: 36, right: 36),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Login or create your account",
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
                //email
                Positioned(
                  width: media.width,
                  child: Container (
                    padding: EdgeInsets.only(top: 336.0, left: 48.0, right: 48.0),
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
                    padding: EdgeInsets.only(top: 416.0, left: 48.0, right: 48.0),
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
                // forgot password
                Positioned(
                  child: Container(
                    padding: EdgeInsets.only(top: 504.0, right: 48.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Forgot your password?",
                          style: TextStyle(
                            color: mediumspringgreen,
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Submit Button
                Positioned(
                  top: 704,
                  left: media.width - 128,
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
                    padding: EdgeInsets.only(top: 800.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: mediumspringgreen,
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            gotoSignUp();
                          },
                          child: Text(
                            " Signup",
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
  gotoSignUp() {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Signup();
    }));
  }
  gotoDashboard() {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Dashboard();
    }));
  }
}
