import 'package:flutter/material.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BtClass Food')
      ),
      body: Contain(
        color: Colors.yellow
      ),
    );
  }
}