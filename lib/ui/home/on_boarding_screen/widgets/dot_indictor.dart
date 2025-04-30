import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../style/ColorManager.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width:isActive==true ? 24: 8,
      margin: EdgeInsets.all(3),
      height: 8,
      decoration: BoxDecoration(
          color:isActive ? ColorManager.primary:Colors.grey,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
