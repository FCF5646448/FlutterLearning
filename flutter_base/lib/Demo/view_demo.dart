import 'package:flutter/material.dart';
import 'package:flutter_base/model/post.dart';

class ViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {

  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 交叉轴数量
        crossAxisSpacing: 8.0, //交叉轴 间隔
        mainAxisSpacing: 8.0, //主轴 间隔
      ), 
      itemBuilder: _gridItemBuilder,
    );
  }
}


class GridViewExtendDemo extends StatelessWidget {
  List<Widget> _buildTitles(int length) {
    return List.generate(length, (index) {
      return Container(
          color: Colors.grey[300],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 100, //交叉轴上 item的最大尺寸
      crossAxisSpacing: 16.0, //交叉轴 item之间的空隙
      mainAxisSpacing: 16.0, // 主轴 item之间的空隙
      children: _buildTitles(posts.length),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTitles(int length) {
    return List.generate(length, (index) {
      return Container(
          color: Colors.grey[300],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4, //在交叉轴显示的数量
      crossAxisSpacing: 16.0, //交叉轴 item之间的空隙
      mainAxisSpacing: 16.0, // 主轴 item之间的空隙
      children: _buildTitles(100),
    );
  }
}

class PageViewBuildDemo extends StatelessWidget {
  Widget _pageItemBuider(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl, 
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,  
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                posts[index].author,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuider,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  const PageViewDemo({
    Key key,
  }) : super(key: key);

  List<Widget> _buildPageViewChild(int length) {
    return List.generate(length, (index) {
      return Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0,0.0),
          child: Text(
            'Page $index',
            style: TextStyle(fontSize: 32.0, color: Colors.white)
          ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      // pageSnapping: false, // 是否分页滚动
      reverse: true, //数据源是否倒序
      scrollDirection: Axis.vertical, //滚动方向
      onPageChanged: (currentPage)=>debugPrint('page: $currentPage'), //滚动结果回调
      controller: PageController( // 是用于控制pageview上显示的页面用的对象
        initialPage: 1, //控制默认选中的页面
        keepPage: false, // 默认pageview会记录用户滚动到哪个页面，可以使用这个属性设置是否需要记录
        viewportFraction: 0.85, //默认pageview的每一个子视图都是沾满整个pageview，这里可以设置它占用百分比。
      ),
      children: _buildPageViewChild(10),
    );
  }
}