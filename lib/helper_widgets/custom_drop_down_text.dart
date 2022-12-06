

import 'package:flutter/cupertino.dart';

import '../configs/text_styles.dart';

class CustomDropDownText extends StatelessWidget {
  final  String text;
  const CustomDropDownText({Key? key,  this.text=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 4.0),
      child: Text(text,style: headerStyle,),
    );
  }
}
