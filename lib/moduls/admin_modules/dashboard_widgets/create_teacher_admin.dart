import 'package:flutter/material.dart';
import 'package:school_management_system/configs/colors.dart';
import 'package:school_management_system/helper_widgets/custom_text_field.dart';

import '../../../configs/text_styles.dart';
import '../../../helper_services/custom_loader.dart';
import '../../../helper_widgets/custom_button.dart';
import '../../../helper_widgets/custom_drop_down_text.dart';
import '../../../services/Admin_Services/add_teacher_service.dart';


class CreateTeacherByAdminScreen extends StatefulWidget {
  final bool isShow;
  const CreateTeacherByAdminScreen({this.isShow=true});

  @override
  State<CreateTeacherByAdminScreen> createState() => _CreateTeacherByAdminScreenState();
}

class _CreateTeacherByAdminScreenState extends State<CreateTeacherByAdminScreen> {

  @override
  Widget build(BuildContext context) {
    return widget.isShow==true?CreateTeacher():
    Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Create Teacher",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: CreateTeacher(),
    )
    ;
  }
}

class CreateTeacher extends StatefulWidget {
  const CreateTeacher({Key? key}) : super(key: key);

  @override
  State<CreateTeacher> createState() => _CreateTeacherState();
}

class _CreateTeacherState extends State<CreateTeacher> {
  String? selectedGender;
  bool selectedClass = false;
  List multipleSelected = [];

  String selectedSubject="";

  List classListItem = [

    {
      "id": 0,
      "value": false,
      "title": "Class 1",
    },
    {
      "id": 1,
      "value": false,
      "title": "Class 2",
    },
    {
      "id": 2,
      "value": false,
      "title": "Class 3",
    },
    {
      "id": 3,
      "value": false,
      "title": "Class 4",
    },
  ];
  bool isChecked=false;
  bool isChecked1=false;

  TextEditingController _teacherNameCont=TextEditingController();
  TextEditingController _userNameCont=TextEditingController();
  TextEditingController _passwordCont=TextEditingController();
  TextEditingController _emailCont=TextEditingController();
  _createClassHandler() async {
    CustomLoader.showLoader(context: context);
    await  AddTeachersService().AddTeacher(
        context: context,
        teacherName: _teacherNameCont.text,
        userName: _userNameCont.text,
        password: _passwordCont.text,
        email: _emailCont.text,
        imageUrl: "",
        role: "Admin",
        phoneNo: "",
        about: "", schoolId: 1);
    CustomLoader.hideLoader(context);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Create Teacher",
            style: createStyle,
          ),
          CustomTextField(
            headerText: "Teacher Name",
            hintText: "Enter Name",
            controller: _teacherNameCont,
            inputAction: TextInputAction.next,
          ),
          CustomTextField(
            headerText: "username",
            hintText: "Enter UserName",
            controller: _userNameCont,
            inputType: TextInputType.visiblePassword,
            inputAction: TextInputAction.next,
          ),
          CustomTextField(
            headerText: "Password",
            hintText: "******",
            controller: _passwordCont,
            inputType: TextInputType.visiblePassword,
            inputAction: TextInputAction.next,
          ),
          CustomTextField(
            headerText: "Email",
            hintText:"Email",
            controller: _emailCont,
            inputType: TextInputType.emailAddress,
            inputAction: TextInputAction.next,
          ),




        ],
      ),
    );
  }
}
