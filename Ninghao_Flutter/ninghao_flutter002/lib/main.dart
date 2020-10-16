import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ninghao_flutter002/Demo/listView_demo.dart';
import './Demo/listView_demo.dart';
import './Demo/drawer_demo.dart';
import './Demo/botton_navigation_bar_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
          primaryColor: Colors.yellow,
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigation',  //说明一下作用
          //   onPressed: () => debugPrint('Navigation did Pressed'),
          // ),
          title: Text('home'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => debugPrint('Search Button is pressed'),
            ),
            IconButton(
                icon: Icon(Icons.more_horiz),
                tooltip: 'MoreButton',
                onPressed: () => debugPrint('More Button is pressed')),
          ],
          elevation: 0.0,
          bottom: TabBar(
            // 定制选中样式
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            //滚动的三个按钮
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            Icon(Icons.change_history, size: 128.0, color: Colors.black12),
            Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
          ],
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
