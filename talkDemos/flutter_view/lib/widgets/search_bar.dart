import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30), //上下间距
      padding:
          EdgeInsets.symmetric(horizontal: 30, vertical: 5), //内边距
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29.5),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search', //提示文字
            icon: SvgPicture.asset(
                "assets/icons/search.svg"), //搜索icon
            border: InputBorder.none //去除横线
            ),
      ),
    );
  }
}