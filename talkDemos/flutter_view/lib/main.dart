import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_view/constants.dart';
import 'package:flutter_view/widgets/details_screen.dart';
import './widgets/category_card.dart';
import './widgets/bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'fcf',
      theme: ThemeData(
        // fontFamily: 'Cairo',
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取设备的size
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: [
          Container(
            // 顶部占整个屏幕的45%
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEBB),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //要有多个
              children: [
                // 顶部按钮
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2BEA1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                        "assets/icons/menu.svg"), //这个要用双引号，否则报错
                  ),
                ),
                Text(
                  'Good Evening \nShishir',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30), //上下间距
                  padding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 5), //内边距
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29.5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search', //提示文字
                        icon: SvgPicture.asset(
                            "assets/icons/search.svg"), //搜索icon
                        border: InputBorder.none //去除横线
                        ),
                  ),
                ),
                Expanded(
                  //不布套Expended，则内容没法显示
                  child: CategoryCard(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return DetailsScreen();
                        }),  
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}