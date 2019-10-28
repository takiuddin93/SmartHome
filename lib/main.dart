import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarthome/pages/dashboard.dart';
import 'package:smarthome/pages/signup.dart';
import 'package:smarthome/pages/login.dart';

Color mediumspringgreen = Color(0xFF26D07C);
Color creamywhite = Color(0xFFF5F5F1);

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Home());
} 

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/main_background.png",
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
                          "Smart",
                          style: TextStyle(
                            color: mediumspringgreen,
                            fontSize: 30.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: mediumspringgreen,
                            fontSize: 30.0,
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
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 90.0, right: 90.0, top: 576.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F1),
                      borderRadius: BorderRadius.circular(40.0),
                      boxShadow: [
                        new BoxShadow(
                          color: Color(0x29000000),
                          offset: new Offset(0.0, 4.0),
                          blurRadius: 8.0
                        )
                      ],
                    ),
                    child: new OutlineButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
                      color: mediumspringgreen,
                      highlightedBorderColor: mediumspringgreen,
                      borderSide: BorderSide(
                        color: mediumspringgreen, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 2, //width of the border
                      ),
                      onPressed: () => gotoSignup(),
                      child: new Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: Text(
                                "Sign Up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: mediumspringgreen,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  
                  ),
                ),
                Positioned(
                  width: media.width,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 90.0, right: 90.0, top: 672.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: mediumspringgreen,
                      borderRadius: BorderRadius.circular(40.0),
                      boxShadow: [
                        new BoxShadow(
                          color: Color(0x29000000),
                          offset: new Offset(0.0, 4.0),
                          blurRadius: 8.0
                        )
                      ],
                    ),
                    child: new OutlineButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
                      color: mediumspringgreen,
                      highlightedBorderColor: mediumspringgreen,
                      borderSide: BorderSide(
                        color: mediumspringgreen, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 2, //width of the border
                      ),
                      onPressed: () => gotoLogin(),
                      child: new Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFF5F5F1),
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
  gotoSignup() {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Signup();
    }));
  }
}
