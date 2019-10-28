import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 3;

    return Material(
      color: Color(0xffffffff),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: BottomNavigationBar(
        currentIndex: _cIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFF26D07C),
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xFFF5F5F1),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: new Text(
              '',
              style: TextStyle(color: Color(0xFF26D07C)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.multiline_chart,
            ),
            title: new Text(
              '',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            title: new Text(
              '',
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
        onTap: (index){
            _incrementTab(index);
        },
      ) 
    );
  }
}
