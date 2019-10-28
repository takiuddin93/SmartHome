import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:smarthome/utils/top_curve_clipper.dart';
import 'package:smarthome/utils/bottom_bar.dart';

void main() => runApp(Dashboard());

class Dashboard extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(title: 'Smart Home'),
    );
  }
}

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin {

  bool isSwitched = true;
  Color frontdoorColor;
  String frontdoorText = "Un-Locked";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,//(0xFF26D07C),
      //   elevation: 0.0,
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.menu, color: Color(0xFF465062)),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: Container(
        height: media.height,
        width: media.width,
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: TopCurveClipper(),
              child: Container(
                height: media.height,
                width: media.width,
                decoration: BoxDecoration(
                  color: Color(0xFF26D07C),
                ),
              ),
            ),
            Positioned(
              top: 24,
              left: 24,
              width: media.width,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Good morning",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 48,
              left: 24,
              width: media.width,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Taki",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            // Dashboard
            Positioned(
              top: media.height * .06,
              width: media.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 20,
                ),
                child: Container(
                  height: 60,
                  child: Column(
                    children: <Widget>[
                      buildDashboardRow(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: media.height * .15,
              height: (media.height * .5),
              width: media.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            buildRoutinesItem1(media),
                            Divider(color: Colors.transparent, height: 24),
                            buildRoutinesItem2(media),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // BottomBar
            Positioned(
              bottom: 0,
              width: media.width,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    new BoxShadow(
                      color: Color(0x29000000),
                      offset: new Offset(0.0, -4.0),
                      blurRadius: 16.0
                    )
                  ],
                ),
                child: BottomBar(),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildDashboardRow() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/temperature.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "19 °C",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Temp",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/humidity.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "76 %",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Humid",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/front-door.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Locked",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Door",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRoutinesItem1(Size media) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              height: media.height * .5,
              width: media.width * .5,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  new BoxShadow(
                    color: Color(0x29000000),
                    offset: new Offset(0.0, 4.0),
                    blurRadius: 16.0
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Bed Room",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "No Occupant",
                            style: TextStyle(
                              color: Color(0xFFDBE2E9),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "5 Devices Active",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          CupertinoSwitch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Color(0xFF26D07C),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          VerticalDivider(
            color: Colors.transparent,
            width: 16,
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: media.height * .5,
              width: media.width * .5,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  new BoxShadow(
                    color: Color(0x29000000),
                    offset: new Offset(0.0, 4.0),
                    blurRadius: 16.0
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Kids Room",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "No Occupant",
                            style: TextStyle(
                              color: Color(0xFFDBE2E9),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "3 Devices Active",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          CupertinoSwitch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Color(0xFF26D07C),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  Widget buildRoutinesItem2(Size media) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              height: media.height * .5,
              width: media.width * .5,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  new BoxShadow(
                    color: Color(0x29000000),
                    offset: new Offset(0.0, 4.0),
                    blurRadius: 16.0
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Living Room",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "No Occupant",
                            style: TextStyle(
                              color: Color(0xFFDBE2E9),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "5 Devices Active",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          CupertinoSwitch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Color(0xFF26D07C),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          VerticalDivider(
            color: Colors.transparent,
            width: 16,
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: media.height * .5,
              width: media.width * .5,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  new BoxShadow(
                    color: Color(0x29000000),
                    offset: new Offset(0.0, 4.0),
                    blurRadius: 16.0
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Kids Room",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "No Occupant",
                            style: TextStyle(
                              color: Color(0xFFDBE2E9),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "3 Devices Active",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          CupertinoSwitch(
                            onChanged: (bool value) {},
                            value: false,
                            activeColor: Color(0xFF26D07C),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
