---
title: Flutter 学习01
date: 2019-02-20 15:12:11
tags: Flutter
categories: Flutter基础
description: flutter基础学习: 环境搭建及Demo运行
---

#### [Flutter中文网](https://flutterchina.club/)

flutter 的编辑器是以Android studio或VS Code为主。生成的项目文件夹下对应着iOS和Android文件，里面有对应的平台项目。

#### Dart语法简介
1、变量  var，类似swift，以var关键字声明变量。若没有指定类型，则在第一次赋值时推断类型，之后便不可再变更类型。说明Dart是强类型语言。

```Dart
var t="1000" //
```
2、常量const。
3、关键字final：被final标记后的变量不可再变。
4、Object，Object是dart所有对象的根基类。类似OC的NSObject。
5、dynamic，关键字。类似OC的id类型和swift的Any类型。
6、其他类型：lists数组、sets集合、maps字典、runes UTF-32字符串。
```
//list
var list = [1,2,3];
var constlist = const [1,2,3]; //常量数组
//sets
var set = {'1','2','3'};
var emptySet = <String>{};
//map
var maps = {'key1':'value1','key2':'value2'};
//runes
var clapping = '\u{1f44f}'
//
```
7、**函数Function**。dart中函数也是对象，是Function类型。所以它可以作为变量或参数使用。
dart函数如果没有指定返回值类型则表示是dynamic类型。没有返回值的函数同样使用void表示。
同时它也存在闭包，语法基本和swift无异。
```dart
//没有返回值，默认是dynimic类型。
isNoble(int anum) {
    return anum > 0;
}
//
void simplePrint(int param) {
    print("%d",param);
}
```
对于简洁的函数可以使用=>代替函数块
```dart
bool isNoble(int anum) => anum > 0;
```
可选参数使用[]标记
```dart
String say(String p1,String p2,[String p3]) {
    var resutl = '$p1 and $p2';
    if (p3 != null) {
        result = '$result and $p3';
    }
    return result;
}

print(say('1','2'));
print(say('1','2','3'));
```

**8、异步 Future Stream**
Future表示一个异步操作及其结果值的表示，它是一个异步函数的类型。
**Future.then**
```dart
Future.delayed(new Duration(seconds: 2),(){
   return "hello world";
}).then((data){
    print(data);
});
```
**Future.catchError** 捕获异常
```dart
Future.delayed(new Duration(seconds: 2),(){
    throw AssertionError("Error");
}).then((data){
	//执行成功会走这里
    print("success");
}).catchError((e){
	//执行失败会走这里
    print(e);
})
```
**Future.whenComplete** 无论成功或失败都要走的函数
```dart
Future.delayed(new Duration(seconds: 2),(){
    throw AssertionError("Error");
}).then((data){
    print(data);
}).catchError((e){
    print(e);
}).whenComplete((){
    //无论成功失败都会走的模块
});
```
**Future.wait 等待异步任务执行完后才进行操作**
```dart
Future.wait([
    Future.delayed(new Duration(seconds: 2),(){
        return "hello";
    }),
    Future.delayed(new Duration(seconds: 4),(){
        return "world";
    })
]).then((results){
    print(results[0]+results[1]);
}).catchError((e){
    print(e);
});
```
**使用Future消除 地狱回调**
例子：用户先登录，登录成功后会获得用户id，然后通过用户id去请求用户个人信息，获取个人信息后，缓存到本地
```dart
//先定义各个任务
Future<String> login(String userName,String pwd){
    //用户登录
};
Future<String> getUserInfo(String id){
    //获取用户信息
};
Future saveUserInfo(String info){
    //保存用户信息
};

login("fcf","123456").then((id){
    //用户登录成功后
    return getUserInfo(id);
}).then((userInfo){
    return saveUserInfo(userInfo);
}).then((e){
    //执行保存后的操作
}).catchError((e){
	//处理错误
    print(e);
})
```
**使用Async/wait 消除 地狱回调**
使用同步代码的方式执行异步任务
async 表示函数是异步的，定义的函数会返回一个Future对象，可以使用then方法添加回调函数；
await 后面是一个future，表示等待该异步任务完成，异步任务才会往下走；await必须出现在async函数内部。
```dart
task() asyn{
    try{
        String id = await login('fcf','123456');
        String userInfo = await getUserInfo(id);
        await saveUserInfo(userInfo);
    }catch(e){
        print(e);
    }
}
```
**Stream**
Stream 与 Future不同，它可以接收多个异步操作结果。常用于会多次读取数据的异步任务场景，如网络内容下载、文件读写等
```dart
Stream.fromFutrues([
    Future.delayed(new Duration(seconds: 1),(){
        return 'hello 1';
    }),
    Futurn.delayed(new Duration(seconds: 2),(){
		throw AssertionError('error');
    }),
    Future.delayed(new Duration(seconds: 3),(){
        return 'hello3';
    })
]).listen((data){
    print(data);
}), onError:(e){
    print(e.message);
}.onDone:(){
    
};
```

#### Demo 基础解读
导入Material UI组件库
```dart
import 'package:flutter/material.dart';
```
单行程序简写，进入应用入口
```dart
void main() => runApp(new MyApp());
```
代表Flutter应用的MyApp类：
```dart
class MyApp extends StatelessWidget {...}
```
代表首页的MyHomePage类：
```dart
class MyHomePage extends StatefulWidget {...}
```
注: StatelessWidget与StatefulWidget两个抽象类，用于自定义控件。StatelessWidget是"无状态控件"，StatefulWidget是”有状态控件“。**总而言之，与用户交互，比如键盘输入、滚动、点击等控件，则应该使用StatefulWidget创建控件。如果仅仅是用于展示信息，则使用StatelessWidget。**

**一切皆为widget**

#### 路由管理
路由 是指一个page，类似iOS中的ViewController，安卓中的Activity。 创建一个新page
```dart
class NewRoute extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        	appBar: AppBar(
        		title: Text("New Router"),
        	),
        	body: Center(
        		child: Text("This is a new route"),
        	),
        );
    }
}
```
Scaffold：是一个类似navigation + body + tabBar 的组合框架。它包含了头部导航栏、body、右下角浮动按钮、底部导航栏等。
*  **路由跳转**
1、导入自定义的路由
```dart
import 'package:flutter_app/NewRoute.dart'
```
2、跳转。MaterialPageRoute是一个Material库的widget，它可以针对iOS和安卓做出对应的跳转切换动画。Navigator 用来管理路由栈。
```dart
Navigator.push(context, new MaterialPageRoute(builder:(context){
    return new NewRoute();
}));
```

也可以通过注册路由表的方式，通过对应的路由名称进行跳转。
```dart
// 1、注册路由表 在MaterialApp中添加routes属性
routes: {
        'new_page':(context)=>NewRoute(),
      },
// 2、跳转的时候
Navigator.pushNamed(context, 'new_page');
```
但是这有个问题就是如果是有传参的跳转。那就得在注册路由表时就得把参数传过去。这就会产生问题。

#### 包管理
flutte r也有类似cocoapods的依赖管理工具——pubspec.yaml
dependencies：应用或包依赖的其他包或插件
dev_dependencies：开发环境依赖的工具包

Pub 仓库 是 Google官方的Dart Parkages仓库，我们可以在pub查找需要的包和插件，也可以像pub发布我们自己编写的包和插件。
eg:
1、实现一个随机显示字符串的widget。 依赖的包叫做 english_words (使用之前必须确认其支持flutter)
在dependencies: 添加
```dart
	#新添加依赖包
	english_words: ^3.1.5
```
编辑完后点击右上角的 Package get (目前实验，这里需要关闭CND)
编辑使用库
```dart
class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}
# 将其放到 HomePage的Column的子widget中：children: <Widget>
RandomWordsWidget()//添加进随机数
```
#### 资源管理
Flutter包含代码和assets，assets包括静态文件、配置文件、图标图片等。会打包到程序安装包中，可运行时访问。
assets资源也是通过Flutter的pubspec.yaml管理。位置是在flutter:下
1、存放资源的文件夹应该和pubspec.yaml所在的位置显示标识；
2、获取资源的时候，会在相邻的子目录中查找相同名称的文件；(主资源与变体)
3、通过AssetBundle访问asset
```dart
# 加载文本assets
import 'dart:asyn' show Future
import 'package:flutter/services.dart' show rootBundle

Future<String> loadAsset() asyn{
    return await rootBundle.loadString('assets/config.json');
}

```
4、对应不同像素的照片(1x、2x、3x)等，无法将照片想xcode那样放到一起，而是使用特定的目录结构来保存asset：
```
.../my_icon.png
.../2.0x/my_icon.png
.../3.0x/my_icon.png
```
5、加载依赖包中的图片必须给AssetImage提供package参数
```dart
new AssetImage('icons/heart.png', package: 'my_icons')
//或
new Image.asset('icons/heart.png', package: 'my_icons')
```
6、以上都是flutter使用资源的点，而特定平台的资源使用（比如icon和启动页），则要到对应的平台文件夹下的assets去设置。安卓的目录是在'/android/app/src/main/res'里，iOS的则是在'/ios/Runner/Assets.xcassets'下

#### 调试

#### Dart线程模型与异常捕获
![](https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/both-queues.png)






