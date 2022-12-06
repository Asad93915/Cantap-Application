


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configs/colors.dart';
import '../../helper_widgets/custom_button.dart';
import '../../helper_widgets/custom_text_field.dart';
import '../Assign_tutorials.dart';

class CreateClassScreen extends StatefulWidget {
  const CreateClassScreen({Key? key}) : super(key: key);

  @override
  State<CreateClassScreen> createState() => _CreateClassScreenState();
}

class _CreateClassScreenState extends State<CreateClassScreen> {
  String selectedClass="";
  List<String> _classList=["One","Two","Three","Four","Five","Six"];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/images/create_class.png"),
        Text("Select Class",style: TextStyle(color: blackColor,fontSize: 16.0,fontWeight: FontWeight.w700,height: 2.5),),
        Container(
          margin: EdgeInsets.symmetric(vertical: 6.0),
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          height: 45.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                  color: selectedClass.isEmpty?lightBlackColor:bgColor,
                  width: 1.5
              )
          ),

          child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              hint: Text(selectedClass.isEmpty? "Select Class":selectedClass),
              items: _classList.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(
              ), onChanged: (String ? value){

            selectedClass=value!;
            setState(() {

            });
          }),
        ),
        CustomTextField(
          labelText:" Enter userName",
          hintText: "Enter UserName",
        ),
        CustomTextField(
          labelText: "Enter Password",
          hintText: "Password",
        ),
        CustomButton(
          width: double.infinity,
          text: "Submit",
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          verticalMargin: 15.0,
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context)=>AssignTutorialsScreen()));
            setState(() {
              print("submit");
            });
          },
        )
      ],
    );
  }
}
