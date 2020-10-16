import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Demo/listView_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation', 
            onPressed: () => debugPrint('Navigation did Pressed'),
          ),
          title: Text('home'),
          elevation: 0.0,
        ),
        body: ListViewDemo(),
    );
  }
}
