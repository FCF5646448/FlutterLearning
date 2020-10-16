**基础控件学习**

* 按钮IconButton 
```
IconButton(
	icon: Icon(Icons.search), 
	tooltip: 'Search',
	onPressed: ()=>debugPrint('Search Button is pressed'),
),
```
* 标签 Tab。Tab是由TabBaT（标签栏）、TabView（标签视图）、TabController（标签控制器）组成。
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
* 抽屉Drawer，默认就带有手势滑动，endDrawer是右侧抽屉。需要注意的是，AppBar不设置leading按钮的话，会自动带有一个menu按钮，如果设置好了抽屉，点击这个按钮，就能够自动打开抽屉
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

* 底部导航栏 BottomNavigationBar，需要注意的是如果个数超过3个，需要设置一下type
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
* 


