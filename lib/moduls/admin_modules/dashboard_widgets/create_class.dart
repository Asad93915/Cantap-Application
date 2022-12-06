import 'package:flutter/material.dart';
import 'package:school_management_system/helper_services/custom_loader.dart';
import 'package:school_management_system/services/Admin_Services/add_teacher_service.dart';
import '../../../configs/colors.dart';
import '../../../configs/text_styles.dart';
import '../../../helper_widgets/custom_button.dart';
import '../../../helper_widgets/custom_drop_down.dart';
import '../../../helper_widgets/custom_drop_down_text.dart';
import '../../../helper_widgets/custom_text_field.dart';

class CreateClassScreen extends StatefulWidget {
  final bool? isShow;

  CreateClassScreen({Key? key, this.isShow = true});

  @override
  State<CreateClassScreen> createState() => _CreateClassScreenState();
}

class _CreateClassScreenState extends State<CreateClassScreen> {


  @override
  Widget build(BuildContext context) {
    return widget.isShow == true ? CrerateClass() :
    Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Create Class",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: CrerateClass(),
    )
    ;
  }
}

class CrerateClass extends StatefulWidget {

  const CrerateClass({Key? key}) : super(key: key);

  @override
  State<CrerateClass> createState() => _CrerateClassState();
}

class _CrerateClassState extends State<CrerateClass> {
  String selectedClass = "";
  List<String> classList = [
    "One", "Two", "Three", "Four", "Five"
  ];
  TextEditingController _userNameCont = TextEditingController();
  TextEditingController _passwordCont = TextEditingController();
  TextEditingController _emailCont=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDropDownText(
            text: "Select Class",
          ),
          CustomDropDown(
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              hint: Text(
                  selectedClass.isEmpty ? "Select Class" : selectedClass),
              items: classList.map((item) {
                return DropdownMenuItem(
                  child: Text(item),
                  value: item,
                );
              }).toList(),
              onChanged: (String? value) {
                selectedClass = value!;
                setState(() {

                });
              },
            ),
          ),

          CustomTextField(
            headerText: "User Name",
            inputType: TextInputType.visiblePassword,
            hintText: "userName",
            controller: _userNameCont,
          ),
          CustomTextField(
            headerText: "Password",
            inputType: TextInputType.visiblePassword,
            hintText: "*****",
            controller: _passwordCont,
          ),
          CustomTextField(
            headerText: "Confirm Password",
            inputType: TextInputType.visiblePassword,
            hintText: "*****",
          ),
          Center(
            child: CustomButton(
              width: 200,
              verticalMargin: 12.0,
              text: "Submit",
              onTap: () {

                setState((){});
              },
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text("Sr #", style: classStyle,), flex: 1,),
              Expanded(child: Text("Class Name", style: classStyle,), flex: 2,),
              Expanded(child: Text("User Name", style: classStyle,), flex: 2,),
              Expanded(child: Text("Password", style: classStyle,), flex: 2,),
              Expanded(child: Text("Action", style: classStyle,), flex: 1,)
            ],
          )
        ],
      ),
    );
  }
}
