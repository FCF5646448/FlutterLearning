import 'package:flutter/material.dart';
import 'package:flutter_base/model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Text('Sliver'),
            pinned: true, // 是否固定在界面顶部
            // floating: false, //AppBar是否跟随页面滚动
            expandedHeight: 178.0, //可伸展的高度。
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Sliver'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1792572623,2155285346&fm=26&gp=0.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            //显示在安全区域
            sliver: SliverPadding(
              //内边距需要单独使用SliverPadding设置
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        //每一个Child的显示视图
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0), //设置一个圆角
              elevation: 14.0, //设置阴影
              shadowColor: Colors.grey.withOpacity(0.5), //阴影不透明度
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16/9, // 图片比例
                    child: Image.network( //这个图片不会被圆角切割，不知道为什么
                      posts[index].imageUrl,
                      fit: BoxFit.contain, 
                    ),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          posts[index].author,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: posts.length, //数量
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      //SliverGrid没法直接这种padding
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, //交叉轴显示数量
        crossAxisSpacing: 8.0, //交叉轴空隙
        mainAxisSpacing: 8.0, //主轴空隙
        childAspectRatio: 1.0, //显示比例
      ),
      delegate: SliverChildBuilderDelegate(
        //每一个Child的显示视图
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length, //数量
      ),
    );
  }
}
