import 'package:flutter/material.dart';
import 'package:school_management_system/configs/colors.dart';

import '../configs/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String headerText;
  final double fieldHeight;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? hintText;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixOnTap;

  CustomTextField(
      {this.headerText = "",
      this.fieldHeight = 45.0,
      this.controller,
      this.focusNode,
      this.inputType,
      this.inputAction,
      this.obscureText = false,
      this.onChanged,
      this.hintText='',
      this.labelText = '',
      this.prefixIcon,
      this.suffixIcon,
      this.suffixOnTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText == null ? SizedBox() : Padding(
          padding:  EdgeInsets.symmetric(horizontal: headerText==null?0.0:4.0,vertical: headerText==null?0.0:8.0,),
          child: Text(headerText,style: headerStyle,),
        ),
        Container(
          height: fieldHeight,
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            textInputAction: inputAction,
            focusNode: focusNode,
            obscureText: obscureText,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              // labelText: labelText,

              suffixIcon: suffixIcon==null?null:IconButton(onPressed: suffixOnTap, icon: Icon(suffixIcon)),
              prefixIcon: prefixIcon==null? null:IconButton(onPressed: (){}, icon: Icon(prefixIcon)),


              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: lightBlackColor, width: 1.8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: bgColor, width: 1.8),
              ),
            ),
          ),
        )
      ],
    );
  }
}
