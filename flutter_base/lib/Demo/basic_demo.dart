import 'dart:ui';

import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerDemo();
  }
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      // 设置
      child: Row(
          // 一排横排的小widget, 主轴居中
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.pool, size: 32.0, color: Colors.white),
              // color: Color.fromRGBO(3, 54, 255, 1.0),
              padding: EdgeInsets.all(16), // 内边距
              margin: EdgeInsets.all(8.0), // 外边距
              width: 90.0, // 宽
              height: 90.0, // 高
              decoration: BoxDecoration(
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
            ),
            Container(
              child: Icon(Icons.access_alarm, size: 32.0, color: Colors.white),
              // color: Color.fromRGBO(3, 54, 255, 1.0),
              padding: EdgeInsets.all(16), // 内边距
              margin: EdgeInsets.all(8.0), // 外边距
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
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
            ),
            Container(
              child: Icon(Icons.bubble_chart, size: 32.0, color: Colors.white),
              color: Color.fromRGBO(3, 54, 255, 1.0),
              padding: EdgeInsets.all(16), // 内边距
              margin: EdgeInsets.all(8.0), // 外边距
              width: 90.0,
              height: 90.0,
            ),
          ]),
    );
  }
}

class RichDemo extends StatelessWidget {
  const RichDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'baidu',
          style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontSize: 34.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
                text: '.net',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.green,
                ))
          ]),
    );
  }
}

class TextDemo extends StatelessWidget {
  const TextDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '君不见黄河之水天上来，奔流到海不复回，君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。',
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 16),
      maxLines: 3,
    );
  }
}
