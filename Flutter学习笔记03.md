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

#### Row & Column
row：横向水平布局；Column：纵向布局
mainAxisAlignment 主轴分布方式；
crossAxisAlignment 交叉轴参照方式
```
Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //主轴 spaceAround说明是平均分布在水平方向
        crossAxisAlignment: CrossAxisAlignment.center, //交叉轴 start 说明icon会在垂直方向的顶部对齐
        children: <Widget>[
          IconBadge(Icons.pool),
          IconBadge(Icons.accessible_forward, size: 12.0),
        ],
     ),
```
#### SizedBox 
固定大小的控件
```
// SizedBox 固定尺寸的部件
          //这个box作为间隔使用
          SizedBox( 
            height: 5.0
          ),
          SizedBox(
            width: 16,
            height: 16,
            child: Container(
              // 内容对齐位置 大小在0~1之间
              alignment: Alignment(1.0, 1.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              // 这个子部件设置的size也没用
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
            ),
          ),
```
#### Stack
从底往上存放的布局控件, 可以使用Positioned控件控制在stack的位置
```
Stack(
            children: <Widget>[
              IconBadge(Icons.accessible_forward, size: 36.0),
              //固定位置
              Positioned(
                child: SizedBox(
                  width: 32.0,
                  height: 32.0,
                  child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
                ),
              ),
            ],
          ),
```
#### AspectRatio
比例控件
```
AspectRatio(
            //宽高比是3：2, 宽是整个屏幕的宽度
            aspectRatio: 32.0/2.0,
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0)
            ),
          ),
```
#### ConstrainedBox
宽高受限的控件
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

