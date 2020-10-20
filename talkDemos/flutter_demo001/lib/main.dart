import 'package:flutter/material.dart';
import './demo/bottom_navigationbar_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.yellow,
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () => debugPrint('leading btn did pressed'),
        // ),
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () => debugPrint('more btn did pressed'),
          ),
        ],
      ),
      body: Text('body'),
      drawer: Drawer(
        child: Text('xxx'),
      ),
      bottomNavigationBar: BottomNavigationBarDemo(),
    );
  }
}


