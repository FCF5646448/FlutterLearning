import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly, //主轴 spaceAround说明是平均分布在水平方向
        // crossAxisAlignment: CrossAxisAlignment.center, //交叉轴 start 说明icon会在垂直方向的顶部对齐
        children: <Widget>[
          IconBadge(Icons.pool),
          IconBadge(Icons.accessible_forward, size: 12.0),
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
          // 从低往上的层级
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
          //比例
          AspectRatio(
            //宽高比是3：2, 宽是整个屏幕的宽度
            aspectRatio: 32.0/2.0,
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0)
            ),
          ),
          // 受限
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 10.0, //最小高度
              maxWidth: 200.0, //最大宽度
            ),
            child: Container(
              color: Colors.red
            ),
          ),
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  IconBadge(this.icon, {
    this.size = 32.0
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}