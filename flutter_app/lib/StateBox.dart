import 'package:flutter/material.dart';


class StateTest extends StatelessWidget {
  @override Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text("Test State"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StateBoxA(),
          ParentWidget(),
          ParentWidgetC(),
        ],
      ),
    );
  }
}

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
