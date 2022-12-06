import 'package:flutter/material.dart';

import '../configs/colors.dart';



class CustomButton extends StatefulWidget {

  final String? text;
  final Color? textColor;
  final Color? buttonColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double horizontalMargin;
  final double verticalMargin;
  final Function()? onTap;
  final double height;
  final double width;

  CustomButton(
      {this.height = 45.0,
      this.width=110.0,
      this.text='',
      this.textColor=whiteColor,
      this.buttonColor=bgColor,
      this.fontSize=14.0,
      this.fontWeight=FontWeight.normal,
      this.horizontalMargin=0.0,
      this.verticalMargin=0.0, this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargin,vertical: widget.verticalMargin),

      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: widget.verticalMargin,
                horizontal: widget.horizontalMargin
              ),
              primary: widget.buttonColor,
              shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(12.0))),
          onPressed: widget.onTap,

          child: Text(
            widget.text!,
            style: TextStyle(
                color: whiteColor, fontSize: widget.fontSize, fontWeight:widget.fontWeight),
          )),
    );
  }
}
