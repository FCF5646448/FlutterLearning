import 'package:flutter/material.dart';

class SimpleWidgets extends StatefulWidget {
  @override
  _SimpleWidgetState createState() => new _SimpleWidgetState();
}

class _SimpleWidgetState extends State<SimpleWidgets> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;

  TextEditingController _unameController = new TextEditingController();
  TextEditingController _upwdController = new TextEditingController();

  FocusNode namefocusNode = new FocusNode();
  FocusNode pwdfocusNode = new FocusNode();
  FocusScopeNode focusScopeNode; //管理焦点


  //给controller添加监听
  @override
  void initState() {
    //监听
    _unameController.addListener(() {
      print(_unameController.text);
    });

    _upwdController.addListener(() {
      print(_upwdController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('基础Widget'),
        ),
        body: new Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hello world',
                  textAlign: TextAlign.center,
                ),
            //对其方式，参照系是widget本身

                Text(
                  'Hello world! Im fcf! ' * 2, //字符串重复4次
                  maxLines: 1, //最多1行
                  overflow: TextOverflow.ellipsis, //显示不全的截断方式
                ),

                Text(
                  'Hello world',
                  textScaleFactor: 1.5,
                ), //相对于当前字体缩放，默认是1.0
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  //漂浮按钮，默认带有阴影和背景色
                  child: Text('RaisedButton'),
                  onPressed: (){
                    debugPrint('RaisedButton onPressed');
                  },
                ),

                FlatButton(
                  //扁平按钮，默认背景透明，不带阴影
                  child:Text('FlatButton'),
                  onPressed: (){
                    debugPrint('FlatButton onPressed');
                  },
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  //默认有边框的按钮
                  child: Text('移动焦点'),
                  onPressed: () {
                    if(null == focusScopeNode){
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(pwdfocusNode);
                  },
                ),

                IconButton(
                  //可点击的icon，默认没有背景，点击后会出现背景。
                  icon: Icon(Icons.thumb_up),
                  onPressed: (){

                  },
                ),

                FlatButton(
                  //自定义一个扁平化按钮
                  color: Colors.blue, //背景色
                  highlightColor: Colors.blue[700],
                  //按钮点击背景色
                  colorBrightness: Brightness.dark, //按钮主题
                  splashColor: Colors.grey, //点击时，水波动画中水波颜色
                  child: Text('隐藏键盘'),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //外形样式
                  onPressed: (){
                    namefocusNode.unfocus();
                    pwdfocusNode.unfocus();
                  },
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //本地资源图
                Image(
                  image: AssetImage("assets/1.jpg"),
                  width: 100.0,
                ),
                //网络资源图
                Image(
                  image: NetworkImage('https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
                  width: 100.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.difference,
                ),
              ],
            ),

            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("\uE914", style: TextStyle(
                  fontFamily: 'MaterialIcons',
                  fontSize: 24.0,
                  color: Colors.green),
                ),

                Icon(Icons.accessible,color: Colors.green, ),

                Icon(Icons.error, color: Colors.red,),

                Icon(Icons.fingerprint, color:Colors.blue, ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Switch(
                  value: _switchSelected,
                  //当前状态
                  onChanged: (value){
                    setState(() {
                      _switchSelected = value;
                    });
                  },
                ),

                Checkbox(
                  value: _checkboxSelected, //当前状态
                  activeColor: Colors.red, //激活状态的颜色
                  onChanged: (value){
                    setState(() {
                      _checkboxSelected = value;
                    });
                  },
                ),
              ],
            ),

            TextField(
              autofocus:true,
              controller:_unameController,
              focusNode:namefocusNode,
              decoration:InputDecoration(
                labelText:"用户名：",
                hintText:"请填写正确用户名",
                prefixIcon:Icon(Icons.person)
              ),
            ),

            TextField(
              controller:_upwdController,
              focusNode:pwdfocusNode,
              decoration:InputDecoration(
                labelText:"密码：",
                hintText:"请填写密码",
                prefixIcon:Icon(Icons.lock)
              ),
              obscureText:true, //是否密码
            ),
          ],
        ),
    );
  }
}
