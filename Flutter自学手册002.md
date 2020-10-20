

### VSCode 使用

#### 快捷键

- command + shift + p调起命令面板

#### 命令行 直接在VSCode下的命令面板中使用

- flutter doctor 查看Flutter运行环境
- flutter emulator 查看可以运行的设备
- flutter emulator --launch apple_ios_simulator 选择运行的设备(apple_ios_simulator是指苹果模拟器)
- flutter run 运行当前程序

### 基础

#### 基础回顾

- 函数的主题入口，main函数，main入口调用一个runApp()函数，函数runApp()包含一个Widget。所以简单的flutter项目就是

```
void main() {
  runApp(
    Text('fcf', textDirection: TextDirection.ltr)
  );
}
```

可以改进成

```
void mian() => runApp(Text('fcf', textDirection: TextDirection.ltr));
```

- 自定义Widget。所有的widget都继承自StatelessWidget或StatefulWidget。然后调用Widget的build方法去定制widget。

```
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('fcf', textDirection: TextDirection.ltr)
  }
}
```

- iOS默认风格的Scaffold组件使用：

```
void main() => runApp(App());

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
```



### 界面结构

#### 按钮IconButton 
```
IconButton(
	icon: Icon(Icons.search), 
	tooltip: 'Search',
	onPressed: ()=>debugPrint('Search Button is pressed'),
),
```
#### 标签 Tab。
Tab是由TabBaT（标签栏）、TabView（标签视图）、TabController（标签控制器）组成。

```
	DefaultTabController(
      length: 3, 
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar( 
          title: Text('home'),
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
            Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
            Icon(Icons.change_history, size: 128.0, color: Colors.black12),
            Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
          ],
        ),
      ),
    );
```
#### 抽屉Drawer
默认就带有手势滑动，endDrawer是右侧抽屉。需要注意的是，AppBar不设置leading按钮的话，会自动带有一个menu按钮，如果设置好了抽屉，点击这个按钮，就能够自动打开抽屉
```
		Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget> [
             //抽屉头部
              DrawerHeader(
                child: Text('header'.toUpperCase()),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
              ),
              ListTile(
                title: Text('Message', textAlign: TextAlign.right),
                trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
              ),
              ListTile(
                title: Text('Favorite', textAlign: TextAlign.right),
                trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
              ),
              ListTile(
                title: Text('Settings', textAlign: TextAlign.right),
                trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
              ),
            ],
          ),
        )

// DrawerHeader 也可以使用专门显示用户的控件 UserAccountDrawerHeader
UserAccountsDrawerHeader(
                accountName: Text('fcf', style: TextStyle(fontWeight: FontWeight.bold)),
                accountEmail: Text('fcf@gmal.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1403323089,1578509831&fm=26&gp=0.jpg'),
                ),
              ),
        
```

#### 底部导航栏 BottomNavigationBar
需要注意的是如果个数超过3个，需要设置一下type
```
BottomNavigationBar(
          type: BottomNavigationBarType.fixed, //
          fixedColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text('Explore'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text('History'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('List'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('My'),
            ),
          ],
        ),
```



### 基础部件

#### Container 
如果需要一块尺寸，要设置它的内外边距，宽高等属性，则可以使用Container。
```
Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
            color: Color.fromRGBO(3, 54, 255, 1.0),
            padding: EdgeInsets.all(16), // 内边距
            margin: EdgeInsets.all(8.0), // 外边距
            width: 90.0,  // 宽
            height: 90.0, // 高
          )
```
#### BoxDecoration 
用于设置装饰。比如说border、Radius、shadown、形状、渐变、背景图等。
```
BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0), //写了这个颜色需要注释掉外部的color
                // 设置border，设置所有Border.all(), 单独设置 Border（top: BorderSide(xxx) , left: xxx ...)
                border: Border.all(
                  color: Colors.red,
                  width: 5.0,
                  style: BorderStyle.solid,
                ),
                /*
              所有角：BorderRadius.circular(16.0)，单独角设置 BorderRadius.only. 这里需要注意的是，
              如果border只设置了top, borderRadius却要设置all，那么就会出现显示问题。
              */
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(64.0),
                  bottomLeft: Radius.circular(64.0),
                ),
                //
                boxShadow: [
                  //可以添加几组阴影效果
                  BoxShadow(
                    offset: Offset(6.0, 7.0), //x轴、y轴的阴影偏移
                    color: Color.fromRGBO(16, 20, 188, 1.0), //阴影颜色
                    blurRadius: 1.0, //阴影模糊程度
                    spreadRadius: 2.0, //控制阴影扩散程度，正数扩大，负数缩小
                  )
                ],
                //shape 可以改变形状, 注意，圆形的box里不能使用圆角效果。
                shape: BoxShape.rectangle,
                // gradient 渐变效果 RadialGradient: 镜像渐变， LinearGradient: 线性渐变，可以设置起始和结束位置
                // gradient: RadialGradient(
                //   colors: [
                //     Color.fromRGBO(7, 102, 255, 1.0),
                //     Color.fromRGBO(3, 28, 128, 1.0),
                //   ],
                // ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),

BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1847371033,3921007484&fm=26&gp=0.jpg'),
                  alignment: Alignment.topCenter, //图片位置
                  repeat: ImageRepeat.repeatY, // 重复
                  fit: BoxFit.cover, // 填充样式
                  colorFilter: ColorFilter.mode(
                      Colors.indigoAccent[400], BlendMode.hardLight),
                ),
              ),
```

### 布局 
指包含某些布局特性的Widget
#### Row & Column
Row：chidren会水平排列在一起；Column：chidren会水平竖直在一起。
mainAxisAlignment 主轴排列分布，可以居中、平均分布等
crossAxisAlignment 交叉轴方向，一般用于设置统一的参照线
```
Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //主轴 spaceAround说明是平均分布在水平方向
        crossAxisAlignment: CrossAxisAlignment.start, //交叉轴 start 说明icon会在垂直方向的顶部对齐
        children: <Widget>[
          IconBadge(Icons.pool),
          IconBadge(Icons.accessible_forward, size: 64.0),
          IconBadge(Icons.business_center),
        ],
      ),

```
#### SizeBox
固定尺寸的小控件
```
//这个box作为间隔使用
          SizedBox( 
            height: 20.0
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: Container(
              // 内容对齐位置 大小在0~1之间, 这里内容在右下角
              alignment: Alignment(1.0, 1.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
            ),
          ),
```
#### stack
stack里的小部件会从底层往上叠加到一块。可以添加一些Position小部件，Position小部件可以设置距离stack最大控件的上下左右位置。
```
Stack(
            children: <Widget>[
              IconBadge(Icons.accessible_forward, size: 128.0),
              Positioned(
                child: SizedBox(
                  width: 44.0,
                  height: 44.0,
                  child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
                ),
              ),
            ],
          ),
```
#### AspectRatio
可以设置子控件的宽高比例。它会使用子控件的最大的宽度，然后根据比例调整高度。
```
AspectRatio(
            //宽高比是3：2
            aspectRatio: 3.0/2.0,
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0)
            ),
          ),
```
#### ConstraintedBox 
可以给子控件添加限制，比如说最小最大宽度。
```
ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 10.0, //最小高度
              maxWidth: 200.0, //最大宽度
            ),
            child: Container(
              color: Colors.red
            ),
          ),
```

### 视图

#### PageView
主要属性: pageSnapping: 是否回弹，reverse：内容顺序是否倒置，scrollDirection：滚动方向
```
PageView(
	// pageSnapping: false, // 是否分页滚动
      reverse: true, //数据源是否倒序
      scrollDirection: Axis.vertical, //滚动方向
      onPageChanged: (currentPage)=>debugPrint('page: $currentPage'), //滚动结果回调
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0,0.0),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0,0.0),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0,0.0),
        ),
      ],
    );

// 也可以使用PageView.builder()方法进行创建。
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
```

#### GridView

GridView是网格视图，类似iOS的CollectionView，GridView有三种创建方式：
GridView.count：

```
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
```
GridView.extend：
```
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
```
GridView.builder 
```
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
```

#### Sliver

表示一块可视区域；一般我们使用Sliver是把它放到CustomScrollView的sliver属性里面。它表示一类Sliver视图。比如SliverList表示列表视图，可替代PageView；SliverGrid表示网格视图，可以替代GridView。

//SliverGrid

```
class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid( //SliverGrid没法直接这种padding
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, //交叉轴显示数量
        crossAxisSpacing: 8.0, //交叉轴空隙
        mainAxisSpacing: 8.0, //主轴空隙
        childAspectRatio: 1.0, //显示比例
      ),
      delegate: SliverChildBuilderDelegate( //每一个Child的显示视图
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
```

// SliverList

```
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
```

#### SliverAppBar

与AppBar类似。AppBar会一直固定在顶部，SliverAppBar则可以设置一些滚动的行为。





