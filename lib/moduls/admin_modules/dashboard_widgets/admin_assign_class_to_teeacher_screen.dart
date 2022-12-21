import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/helper_services/custom_loader.dart';
import 'package:school_management_system/helper_services/custom_snackbar.dart';
import 'package:school_management_system/providers/get_teacher_assigned_class_provider.dart';
import 'package:school_management_system/providers/get_teachers_list_provider.dart';
import 'package:school_management_system/services/Admin_Services/get_teachers_list_services.dart';
import '../../../configs/colors.dart';
import '../../../helper_widgets/custom_button.dart';
import '../../../helper_widgets/custom_drop_down.dart';
import '../../../helper_widgets/custom_drop_down_text.dart';
import '../../../models/assigned_class_to_teacher_model.dart';
import '../../../providers/get_classes_provider.dart';
import '../../../services/Admin_Services/teacher_assigned_classes_services.dart';
import '../../../services/Admin_Services/update_assigned_class_service.dart';
import '../../../services/get_classes_service.dart';
import '../../../utils/custom_handlers.dart';

class AssignClassToTeachertByAdminScreen extends StatefulWidget {
  final bool isShow;
  AssignClassToTeachertByAdminScreen({this.isShow = true});
  @override
  State<AssignClassToTeachertByAdminScreen> createState() =>
      _AssignClassToTeachertByAdminScreenState();
}

class _AssignClassToTeachertByAdminScreenState
    extends State<AssignClassToTeachertByAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.isShow == true
        ? AssignSunject()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: bgColor,
              title: Text(
                "Assign Class To Teacher",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: AssignSunject(),
          );
  }
}

class AssignSunject extends StatefulWidget {
  const AssignSunject({Key? key}) : super(key: key);

  @override
  State<AssignSunject> createState() => _AssignSunjectState();
}

class _AssignSunjectState extends State<AssignSunject> {
  List<GetAssignedClassToTeacherModel>? assignedClass = [];
  int? selectedTeacher;

  @override
  updatetTeacher(int? value) async {
    selectedTeacher = value;

    setState(() {});
  }

  bool selectedSubject = false;

  int? selectedClass;

  List<int> multipleSelected = [];

  _getAssignedClassHandler(int teacherId) async {
    CustomLoader.showLoader(context: context);
    assignedClass = await TeacherAssignedClassService()
        .getAssignedClasses(context: context, teacherId: teacherId);
    CustomLoader.hideLoader(context);
    setState(() {});
  }

  _updateAssignedClassHandler() async {
    CustomLoader.showLoader(context: context);
   bool res= await updateAssignedClassService()
        .updateAssignedClass(context: context, list: assignedClass!);
    CustomLoader.hideLoader(context);
    if(res){
      CustomSnackBar.showSnackBar(context: context, message: "Data Updated Successfully");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getTeachersHandler(context);
      getClassesHandler(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Teacher",
              style: TextStyle(
                  color: blackColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  height: 2.5),
            ),
            CustomDropDownText(
              text: "Select Tecaher",
            ),
            Consumer<GetTeachersListProvider>(builder: (context, teachers, _) {
              return CustomDropDown(
                child: DropdownButton(
                  value: selectedTeacher,
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text("Select Teacher"),
                  items: teachers.teachersList!.map((item) {
                    return DropdownMenuItem(
                      child: Text(item.name!),
                      value: item.id,
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    updatetTeacher(newValue!);
                    setState(() {});
                    teachers.teachersList!.map((item) {
                      print("City Name ${item.name}");
                      print("newValue $newValue");
                      if (newValue == item.id) {
                        _getAssignedClassHandler(item.id!);
                        // if (multipleSelected ==null) {
                        //   _getAssignedClassHandler(item.id!);
                        // } else {
                        //   multipleSelected = [];
                        //   _getAssignedClassHandler(item.id!);
                        // }

                      }
                    }).toList();
                    //
                    // };

                    setState(() {});
                  },
                ),
              );
            }),
            // CustomDropDownText(
            //   text: "Select Class",
            // ),
            // Consumer<GetClassProvider>(builder: (context,classList,_){
            //   return  CustomDropDown(
            //     child: DropdownButton(
            //       value: selectedClass,
            //       isExpanded: true,
            //       underline: SizedBox(),
            //       hint: Text("Select Class"),
            //       items: classList.myClass!.map((item){
            //         return DropdownMenuItem(
            //           child: Text(item.name??""),
            //           value: item.standardId,
            //         );
            //       } ).toList(),
            //       onChanged: (int? value) {
            //         selectedClass=value!;
            //         setState(() {
            //
            //         });
            //       },
            //     ),
            //   );
            // }),
            CustomDropDownText(
              text: "Select Class",
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 45.0,
              width: double.infinity,
              margin: EdgeInsets.only(left: 4.0, top: 8.0, right: 4.0),
              decoration: BoxDecoration(
                border: Border.all(
                    color: selectedSubject == false ? lightBlackColor : bgColor,
                    width: 1.5),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: InkWell(
                onTap: () {
                  if (assignedClass!.isNotEmpty) {
                    selectedSubject = !selectedSubject;
                  }
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(selectedClass == true ? Icons.remove : Icons.add),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Select Class",
                      style: TextStyle(height: 1.26),
                    ),
                  ],
                ),
              ),
            ),
            selectedSubject == true
                ? AnimatedContainer(
                    duration: Duration(microseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    padding: const EdgeInsets.only(
                        left: 30, top: 20, bottom: 20, right: 30),
                    decoration: BoxDecoration(
                      border: Border.all(color: bgColor, width: 1.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          assignedClass!.length,
                          (index) => CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                              activeColor: bgColor,
                              dense: true,
                              title: Text(
                                assignedClass![index].name!,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              // value: subjectListItem[index]["value"],
                              value: assignedClass![index].isSelected!,
                              onChanged: (value) {
                                setState(() {
                                  if (assignedClass![index].isSelected ==
                                      true) {
                                    assignedClass![index].isSelected = false;
                                  } else {
                                    assignedClass![index].isSelected = true;
                                  }
                                  ;
                                  setState(() {});
                                  // multipleSelected.add(classList.myClass![index].standardId!);
                                  // multipleSelected.add(index);
                                  //print("Multiple Selected ${assignedClass![index].standardId!}");

                                  // if (multipleSelected.contains(assignedClass![index].standardId!)) {
                                  //   multipleSelected.remove(assignedClass![index].standardId!);
                                  //   print("If ");// unselect
                                  // } else {
                                  //   print("Else");
                                  //   multipleSelected.add(assignedClass![index].standardId!);// select
                                  // }
                                });
                              })),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomButton(
                width: 200,
                verticalMargin: 12.0,
                text: "Submit",
                onTap: () {
                  _updateAssignedClassHandler();
                  setState(() {

                  });
                },
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
