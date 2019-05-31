import 'package:flutter/material.dart';
import 'package:flutter_app/StateBox.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New Router"),
      ),
      body: Column( //Column对应一组children，center对应一个child。
//        child: Echo(text: "hello world"),//Text("This is a new route"),
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Text("This is a new route"),
            Echo(text: "hello world"),
            CounterWidget(), //计数按钮
          ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            Navigator.push(context, new MaterialPageRoute(builder: (context){
              return new StateTest();
            }));
          }
      ),
    );
  }
}


class Echo extends StatelessWidget {
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor:Colors.grey,
  }):super(key:key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}


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

