import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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
  int _counter = 0;
  String _textHolder = '';
  bool _status = false;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeText() {
    setState(() {
      _status = !_status;
    });
    _checkText();
  }

  void _checkText() {
    if (_status == false) {
      setState(() {
        _textHolder = "";
      });
    } else {
      setState(() {
        _textHolder = "Jetnipat Thankeatphangan 6035512021";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.grey[300],
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: 50,
                // width: 50,
                color: Colors.red,
                child: Text(_textHolder),
              ),
              Container(
                  // height: 50,
                  // width: 50,
                  color: Colors.green,
                  child: RaisedButton(
                    onPressed: () {
                      _changeText();
                    },
                    child: Text("Press"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
