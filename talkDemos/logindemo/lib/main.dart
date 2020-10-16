import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends  State<MyApp> {

  static int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff00a0ea),
        backgroundColor: Colors.white,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)
        )
      ),
      home: Container(
        color: Colors.yellow,
        child: SafeArea(
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Expanded(
                  flex: 20,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) => cart(
                    title: '你好，靓仔_${index + 1}',
                    subTitle: '傻逼吧_${index + 1}',
                    imagePath: 'assets/images/IMG_${index + 1}.JPG',
                    )
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate (
                        5,
                        (index) => buildDotContainer(index),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ],
            )
          ),
        ),
      ),
      title: 'login_demo',
    );
  }

  AnimatedContainer buildDotContainer(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
      ),
    );
  }
}

class cart extends StatelessWidget {
  const cart({
    Key key, this.title, this.subTitle, this.imagePath,
  }) : super(key: key);

  final String title, subTitle, imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            this.title, 
            style: Theme.of(context).textTheme.headline.apply(color: Colors.red)
          ),
          Text(
            this.subTitle,
            style: TextStyle(fontSize: 36.0, color: Colors.black),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Image(
              // color: Colors.white[100],
              height: 300,
              width: 300, //screenSize.width * 0.8,
              image: AssetImage(this.imagePath),
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}