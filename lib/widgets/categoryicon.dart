import 'package:flutter/material.dart';

import 'iconfont.dart';

class CategoryIcon extends StatelessWidget {
  Color? color;
  String? iconName;
  double? size;

  CategoryIcon({this.color, this.iconName, this.size = 45});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
          color: this.color,
          padding: EdgeInsets.all(10),
          child: IconFont(
              color: Color.fromRGBO(35, 100, 128, 1), iconName: this.iconName!, size: this.size!)),
    );
  }
}
