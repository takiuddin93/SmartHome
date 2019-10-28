import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:smarthome/utils/top_curve_clipper.dart';
import 'package:smarthome/utils/bottom_bar.dart';

void main() => runApp(RoomDetails());

class RoomDetails extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RoomDetailsPage(title: 'Smart Home'),
    );
  }
}

class RoomDetailsPage extends StatefulWidget {
  RoomDetailsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RoomDetailsPageState createState() => _RoomDetailsPageState();
}

class _RoomDetailsPageState extends State<RoomDetailsPage> with SingleTickerProviderStateMixin {

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
              width: media.width,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Bed Room",
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
              top: media.height * .14,
              height: media.height * 0.6,
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
                            Divider(color: Colors.transparent, height: 0),
                            buildRoutinesItem2(media),
                            Divider(color: Colors.transparent, height: 0),
                            buildRoutinesItem3(media),
                            Divider(color: Colors.transparent, height: 0),
                            buildRoutinesItem4(media),
                            Divider(color: Colors.transparent, height: 0),
                            buildRoutinesItem5(media)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // BottomBar
            // Positioned(
            //   bottom: 0,
            //   width: media.width,
            //   height: 60,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Color(0xFFF5F5F1),
            //       borderRadius: BorderRadius.circular(10),
            //       boxShadow: [
            //         new BoxShadow(
            //           color: Color(0x29000000),
            //           offset: new Offset(0.0, -4.0),
            //           blurRadius: 16.0
            //         )
            //       ],
            //     ),
            //     child: BottomBar(),
            //   ),
            // )
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
            child: Container(
              height: media.height  / 10,
              // width: media.width / 10,
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            "Lights",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 24),
                          child: CupertinoSwitch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Color(0xFF26D07C),
                          ),
                        )
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

  Widget buildRoutinesItem2(Size media) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: media.height  / 10,
              // width: media.width / 10,
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            "Air Conditioner",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 24),
                          child: CupertinoSwitch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Color(0xFF26D07C),
                          ),
                        )
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

  Widget buildRoutinesItem3(Size media) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: media.height  / 10,
              // width: media.width / 10,
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            "TV",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 24),
                          child: CupertinoSwitch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Color(0xFF26D07C),
                          ),
                        )
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
  
  Widget buildRoutinesItem4(Size media) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: media.height  / 10,
              // width: media.width / 10,
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            "Washroom Lights",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 24),
                          child: CupertinoSwitch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Color(0xFF26D07C),
                          ),
                        )
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
  
  Widget buildRoutinesItem5(Size media) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: media.height  / 10,
              // width: media.width / 10,
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            "Washroom Heater",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 24),
                          child: CupertinoSwitch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Color(0xFF26D07C),
                          ),
                        )
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
}
