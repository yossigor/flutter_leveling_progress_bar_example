import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _exp = 0;
  int _lvl = 0;
  int _fullLvlExp = 10;
  void _incrementExp() {
    setState(() {
      if (_exp < _fullLvlExp) {
        _exp++;
      } else {
        _lvl++;
        _fullLvlExp = (_fullLvlExp + 0.1 * 10).floor();
        _exp = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(children: [
        Text('Lvl:$_lvl, Exp:${((_exp / _fullLvlExp)*100).toStringAsFixed(2)}%'),
        LinearProgressIndicator(
          value: _exp / _fullLvlExp,
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementExp,
        tooltip: 'Kill monster',
        child: Icon(Icons.add),
      ), 
    );
  }
}
