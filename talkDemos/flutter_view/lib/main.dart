import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_view/constants.dart';
import './model/posts.dart';

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
                  child: Card(),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {

  List<Widget> _buildCard(BuildContext context , int length) {
    return List.generate(length, (index) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              // 图片不知道怎么设置圆角
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
              ),
              padding: EdgeInsets.all(5),
              child: Image.network(
                posts[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Spacer(),
            Text(
              posts[index].title,
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.headline6.copyWith(fontSize: 15),
            ),
            Text(
              posts[index].author,
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.headline6.copyWith(fontSize: 13),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, //交叉轴数量
      crossAxisSpacing: 20, //交叉轴间隔
      mainAxisSpacing: 20, //主轴间隔
      childAspectRatio: 0.85, //比例
      children:_buildCard(context, posts.length)
    );
  }
}
