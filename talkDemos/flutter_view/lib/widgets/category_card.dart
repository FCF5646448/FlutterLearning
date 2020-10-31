import 'package:flutter/material.dart';
import '../model/posts.dart';
import '../constants.dart';

class CategoryCard extends StatelessWidget {

  final Function press;
  const CategoryCard({
    Key key,
    this.press,
  }) : super(key: key);

  List<Widget> _buildCard(BuildContext context, int length) {
    return List.generate(length, (index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: kShadowColor,
              )
            ],
          ),
          child: Material(
            color: Colors.transparent, //点击颜色
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      // 图片不知道怎么设置圆角
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(13),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(5),
                      child: Image.network(
                        posts[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Spacer(),
                    Text(
                      posts[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 15),
                    ),
                    Text(
                      posts[index].author,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2, //交叉轴数量
        crossAxisSpacing: 20, //交叉轴间隔
        mainAxisSpacing: 20, //主轴间隔
        childAspectRatio: 0.85, //比例
        children: _buildCard(context, posts.length));
  }
}