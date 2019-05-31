---
title: Flutter 学习02
date: 2019-02-20 15:12:11
tags: Flutter
categories: Flutter基础
description: flutter Widget学习，常用的widget学习及使用
---

### widget
Flutter 几乎所有对象都是Widget。不过实际上Widget是“描述一个UI元素的配置数据”，真正显示在屏幕上的元素是Element。
* Widget实际上是Element的配置数据，Widget数实际上就是一个配置树，真正的UI渲染有element构成。
* 一个Widget对象可以对应多个Element对象。

Widget本身是一个抽象类。一般通过继承StatelessWidget和StatefulWidget两个类来间接继承widget类实现。上一节有说过，StatelessWidget和StatefulWidget的区别也就是有无状态的区别。

#### StatelessWidget 
StatelessWidget相对简单一点，因其不需要维护状态，所以只需在build方法中嵌套其他widget来构建UI就可以。
```dart
class Echo entends StatelessWidget {
	//构造函数
    const Echo({
        Key key,
        @required this.text, //@required 必要参数
        this.backgroundColor: UIColor.grey,
    }):super(key:key);

	//变量声明
	final String text;
    final Color backgroundColor;
    
    //build
    @override
    Widget build(BuildContext context) {
        return Center(
        	child:Container(
        		color: backgroundColor,
        		child: Text(text),
        	),
        );
    }
}

//使用
 		body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Text("This is a new route"),
            Echo(text: "hello world"),
          ],
      ),
```


#### StatefulWidget
与StatelessWidget不同的是，StatefulWidget需要维护一个State。
```dart
class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key key,
    this.initValue: 0
  });

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  // 初始化只会被调用1次，
  @override
  void initState() {
    super.initState();
    // 初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  //主要用来构建widget子树的。1、在initState()会被调用；2、在didUpdateWidget()会被调用；3、在setState()之后会被调用；4、在didChangeDependencies()会被调用
  @override
  Widget build(BuildContext context) {
    print("build");
    return Center(
      child: FlatButton(
        child: Text('$_counter'),
        //点击后 计数器自增
        onPressed: ()=>setState(()=> ++_counter),
      ),
    );
  }

  //更新widget
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  //State对象被移动时
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  //State对象被永久移除时
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  //热重载时会被调用 主要用来debug时调试使用，release下不会执行
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }

  // 当State对象的依赖发生变化时会被调用
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
```

### 状态管理
stateful Widget的状态由谁管理？ 
常见的管理方法：
* Widget 管理自己的state；
* 父widget管理子widget的状态；
* 混合管理(父widget和子widget都管理状态)
* 全局状态管理：如果应用里有一些跨widget或路由的状态需要同步时，则需要使用全局状态管理。

如何决定使用哪种管理方法，有以下原则：
* 如果状态是用户数据，如复选框的选中状态、滑块位置，则最好由父widget管理；
* 如果状态是外观效果，例如颜色动画，则最好由widget本身管理；
* 如果某一状态是不同widget共享的，则最好由它们的共同父widget管理。

基本的原理实际上是：通过setState来更新某个变量，当调用setState的时候就会触发build函数，然后在函数内部实现根据变量的不同值进行对应的变化的代码。
父类管理的话，实际就是通过一个block回调，将当前变化返回给父widget，父widget接收到变化后，对子widget执行setState函数，以调用子widget的build。达到管理效果。

来分别感受一下这些代码的区别：
1、widget管理自己的State
```dart
// 自己管理状态
class StateBoxA extends StatefulWidget {
  StateBoxA({Key key}):super(key:key);

  @override
  _StateBoxA createState() => _StateBoxA();
}

class _StateBoxA extends State<StateBoxA> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: (){
        setState(() {
          _active = !_active;
        });
      },
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
```
2、父widget管理State
```dart
// 父类管理状态
class ParentWidget extends StatefulWidget {
  @override _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new StateBoxB(
        active: _active,
        onChanged: (bool newValue){
          setState(() {
            _active = newValue;
          });
        },
      ),
    );
  }
}

class StateBoxB extends StatelessWidget {
  const StateBoxB({
    Key key,
    this.active: false,
    @required this.onChanged}
    ) :super(key:key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: (){
        onChanged(!active);
      },
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height:200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
```
3、混合管理
```dart
//混合管理
class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TapboxC(
        active: _active,
        onChanged: (newValue){
          setState(() {
            _active = newValue;
          });
        },
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  TapboxC({
    Key key,
    this.active: false,
    @required this.onChanged,
  }):super(key:key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，抬起时，取消高亮
    return new GestureDetector(
      onTapDown: (TapDownDetails details){
        setState(() {
          _highlight = true;
        });
      },//处理按下事件
      onTapUp: (TapUpDetails details){
        setState(() {
          _highlight = false;
        });
      },//处理抬起事件
      onTap: (){
        widget.onChanged(!widget.active);//State对应的widget，调用onchanged
      }, // 处理tap事件
      onTapCancel: (){
        setState(() {
          _highlight = false;
        });
      },//取消点击
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive', style: new TextStyle(fontSize: 32.0,color: Colors.white),),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? new Border.all(
            color: Colors.teal[700],
            width: 10.0,
          )
          : null,
        ),
      ),
    );
  }
}
```

### 基础Widgets
#### 文本、字体样式
* 1.1 **Text**。TextStyle用于设置Text的样式属性，比如颜色、字体、高度、换行方式等等
```dart
Text('Hello world',textAlign: TextAlign.center,),//对其方式，参照系是widget本身
          Text('Hello world! Im fcf! '*4, //字符串重复4次
            maxLines: 1, //最多1行
            overflow: TextOverflow.ellipsis, //显示不全的截断方式
          ),
          Text('Hello world', textScaleFactor: 1.5,),//相对于当前字体缩放，默认是1.0
          Text('Fuck',style: TextStyle(
            color: Colors.blue,
            fontSize: 32.0,
            height: 1.2,
            fontFamily: 'Courier',
            background: new Paint()..color = Colors.yellow,
            decoration: TextDecoration.underline, //装饰，比如下划线
            decorationStyle: TextDecorationStyle.dashed //下划线样式
          ),),
```
* 1.2 **Rich TextSpan**  富文本。TextSpan实际上是代表一个文本片段，实际上也相当于原生中的富文本的效果。
```dart
		Text.rich(TextSpan(
            children: [
              TextSpan(text: 'Baidu '),
              TextSpan(
                text: 'www.baidu.com',
                style: TextStyle(
                  color: Colors.red,
                ),
                recognizer: _tapRecognizer,//点击后续
              ),
            ]
          ))
```

* 2、书写默认文本样式：
```dart
		DefaultTextStyle(
            //设置文本默认样式
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('You '),
                Text('are '),
                Text('fool ',
                  style: TextStyle(
                    inherit: false,//不继承样式
                    color: Colors.grey,
                  ),),
              ],
            ),
          )
```
* 3、字体
要使用非默认字体，则首先要在pubspec.yaml中声明，然后在TextStyle使用。
1、将字体文件打包到应用中，然后在pubspec.yaml中声明路径。
2、使用字体时。在TextStyle中使用fontFamily。如果是在package包中，则也要在package中指定包名。
```dart
const textStyle = const TextStyle(
  fontFamily: 'Raleway',
  package: 'my_package', //指定包名
);
```

#### 按钮
Material提供了多种按钮widget。RaisedButton、FlatButton、OutlineButton、IconButton

```dart
		  //漂浮按钮，默认带有阴影和背景色
		  RaisedButton(
            child: Text('RaisedButton'),
            onPressed: ()=>{
              debugPrint('RaisedButton onPressed'),
            },
          ),
          //扁平按钮，默认背景透明，不带阴影
          FlatButton(
            child: Text('FlatButton'),
            onPressed: ()=>{
              debugPrint('FlatButton onPressed'),
            },
          ),
          //默认有边框的按钮
          OutlineButton(
            child: Text('OutlineButton'),
            onPressed: ()=>{
              debugPrint('OutlineButton onPressed'),
            },
          ),
          //可点击的icon，默认没有背景，点击后会出现背景。
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: ()=>{
              debugPrint('IconButton onPressed'),
            },
          ),
          //自定义一个扁平化按钮
          FlatButton(
            color: Colors.blue,//背景色
            highlightColor: Colors.blue[700],//按钮点击背景色
            colorBrightness: Brightness.dark,//按钮主题
            splashColor: Colors.grey,//点击时，水波动画中水波颜色
            child: Text('自定义按钮'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),//外形样式
            onPressed: ()=>{
              debugPrint('自定义按钮 onPressed'),
            },
          ),
```

#### 图片及ICON
Flutter通过Image加载并显示图片，Image的数据源可以是asset、文件、内存及网络。
```dart
//本地资源图
          Image(
            image: AssetImage("assets/1.jpg"), 
            width: 100.0,
          ),
          //网络资源图 
          Image(
            image: NetworkImage('https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
            width: 100.0,
          ),
```
Image 的宽高，如果不指定宽或者高，则图片会根据当前父容器，尽可能的显示其原始大小。如果只设置了width、height的其中一个，那么另一个会默认按比例缩放。
Image的缩放模式fit：
* fill ：会拉伸填充显示空间，图片本身长宽比会发生变化，图片会变形；
* cover ：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被裁剪；
* contain ：默认填充，图片会保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
* fitWidth ：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出部分会被裁剪。
* fitHeight ：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出部分会被裁剪。
* none ：会在图片空间内显示图片，如果图片比空间大，则显示空间只会显示图片中间部分。
Image的颜色，有一个colorBlendMode，颜色混合模式

IconFont 字体图标：它是将图标做成字体文件，然后通过指定不同的字符而显示不同的图片。
在pubspec.yaml中 'uses-material-design: true‘ 即表示使用material design的字体图标
```dart
//通过码点实现图标
          Text("\uE914",style: TextStyle(fontFamily: 'MaterialIcons',fontSize: 24.0,color: Colors.green),),
//通过flutter封装的IconData和Icon显示字体图标
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.accessible,color: Colors.green,),
              Icon(Icons.error,color: Colors.red,),
              Icon(Icons.fingerprint,color: Colors.blue,),
            ],
          )
```
也可以通过使用ttf格式的文件自定义字体图标。

#### 单选开关Switch和复选框checkBox
Switch和CheckBox的状态都是要由父widget管理。所以正常来说应该是在StatefulWidget中使用。
```dart
		Switch(
            value: _switchSelected, //当前状态
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            },
          ),

          Checkbox(
            value: _checkboxSelected, //当前状态
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value;
              });
            },
          ),
```
Switch和Checkbox都有一个activeColor用于设置激活状态下的颜色，Checkbox的大小是固定的，Switch也只能定义宽度，高度也是固定的。

#### 输入框及表单
TextField 这是一个很复杂的widget，首先有个TextEditingController属性用于获取输入的内容，其次需要有FocusNode或FocusScopeNode来控制焦点，比如点击空白页让键盘收起等操作。
```dart
 TextEditingController _unameController = new TextEditingController();
  TextEditingController _upwdController = new TextEditingController();

FocusNode namefocusNode = new FocusNode();
FocusNode pwdfocusNode = new FocusNode();
FocusScopeNode focusScopeNode; //管理焦点
  
  //给controller添加监听，也可以直接给TextField添加onChanged回调。
  @override
  void initState(){
    //监听
    _unameController.addListener((){
      print(_unameController.text);
    });

    _upwdController.addListener((){
      print(_upwdController.text);
    });
  }
TextField(
            autofocus: true,
            controller: _unameController,
            decoration: InputDecoration(
              labelText: "用户名：",
              hintText: "请填写正确用户名",
              prefixIcon: Icon(Icons.person)
            ),
          ),

          TextField(
            controller: _upwdController,
            decoration: InputDecoration(
              labelText: "密码：",
              hintText: "请填写密码",
              prefixIcon: Icon(Icons.lock)
            ),
            obscureText: true, //是否密码
          ),
          
//将焦点移动到密码
onPressed: () {
	if(null == focusScopeNode){
	focusScopeNode = FocusScope.of(context);
	}
	focusScopeNode.requestFocus(pwdfocusNode);
},

//隐藏键盘，失去焦点
onPressed: (){
	namefocusNode.unfocus();
	pwdfocusNode.unfocus();
},

```

