

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/configs/colors.dart';

class CustomDropDown extends StatelessWidget {
  final Widget ?child;
  final bool borderColor;
  CustomDropDown({this.child,  this.borderColor=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      height: 45.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: borderColor==true?bgColor:lightBlackColor,width:1.5)
      ),
      child:child ,
    );
  }
}
