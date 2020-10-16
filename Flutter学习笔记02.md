### VSCode 使用
#### 快捷键
* command + shift + p调起命令面板
#### 命令行 直接在VSCode下的命令面板中使用
* flutter doctor 查看Flutter运行环境
* flutter emulator 查看可以运行的设备
* flutter emulator --launch apple_ios_simulator 选择运行的设备(apple_ios_simulator是指苹果模拟器)
* flutter run 运行当前程序

### 基础
#### 基础回顾
* 函数的主题入口，main函数，main入口调用一个runApp()函数，函数runApp()包含一个Widget。所以简单的flutter项目就是
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
* 自定义Widget。所有的widget都继承自StatelessWidget或StatefulWidget。然后调用Widget的build方法去定制widget。
```
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('fcf', textDirection: TextDirection.ltr)
  }
}
```
* iOS默认风格的Scaffold组件使用：
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



