import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';

void main() => runApp(MyApp());

 class MyApp extends StatelessWidget {
   // This widget is the root of your application.
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Flutter layout',
       theme: ThemeData(
         primarySwatch: Colors.red,
       ),
       home: LayoutPage(),
     );
   }
 }

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleText = Container (
      padding: EdgeInsets.all(20),
      child: Text(
        'flutter layout flex',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );

    final subTitle = Text(
      '''You and I remains the same in different time, at different places,among different people; time is changing, space is changing and everything is changing except my miss to you! ''',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Geprgia',
        fontSize: 25,
      ),
    );

    final rating = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
            ],
          ),
          Text(
            '180 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );

    final descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      fontSize: 20,
      letterSpacing: 20,
      height: 2,
    );

    final iconList = DefaultTextStyle.merge(
      style:descTextStyle,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children:[
            Column(
              children:[
                Icon(Icons.kitchen,color:Colors.green[500]),
                Text('PREP:'),
                Text('25 min'),
              ],
            ),
            Column(
              children:[
                Icon(Icons.timer, color:Colors.green[500]),
                Text('COOK:'),
                Text('1 hr'),
              ],
            ),
            Column(
              children:[
                Icon(Icons.restaurant, color: Colors.green[500]),
                Text('FREEDS:'),
                Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    final leftColumn = Container(
      padding: EdgeInsets.symmetric(horizontal:20, vertical:30),
      child: Column(
        children:[
          titleText,
          subTitle,
          rating,
          iconList,
        ],
      ),
    );

    final mainImage = Image.asset(
      'pages/1/cake1.jpg',
      fit: BoxFit.cover,
    );

    return new Scaffold(
      body: new Center(
        child: Container(
          margin:EdgeInsets.all(5),
          height:600,
          child:Card(
              child:Row(
                children:[
                  Container(
                    width: 440,
                    child: leftColumn,
                  ),
                  mainImage,
                ],
            ),
          ),
        ),
      ),
    );
  }
}

