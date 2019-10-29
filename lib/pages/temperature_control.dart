import 'package:flutter/material.dart';

void main() => runApp(TemperatureControl());

class TemperatureControl extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemperatureControlPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class TemperatureControlPage extends StatefulWidget {
  TemperatureControlPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TemperatureControlPageState createState() => _TemperatureControlPageState();
}

class _TemperatureControlPageState extends State<TemperatureControlPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset('assets/images/smarthome_icon.png'),
            ),
            Expanded(
              child: Image.asset('assets/images/smarthome_icon.png'),
            ),
            Expanded(
              child: Image.asset('assets/images/smarthome_icon.png'),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}