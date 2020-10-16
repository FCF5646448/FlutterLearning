import 'package:flutter/material.dart';
import 'model/post.dart';


void main() => runApp(Home());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('fcf'),
          elevation: 30, //阴影
        ),
        body: Hello(),
      ),
      theme: ThemeData(
        primaryColor: Colors.red, //设置主题色
      ),
    );
  }
}


class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'fcf',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(posts[index].imageUrl),
          SizedBox(height: 10.0),
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.title
          ),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.subhead,
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('home'),
        elevation: 0.0,
      ),
      body: ListView.builder( 
        itemCount: posts.length,
        itemBuilder: _listItemBuilder,
      ),
     ),
    );
  }
}




  