import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../configs/colors.dart';
import '../../../helper_widgets/custom_button.dart';
import '../../../helper_widgets/custom_drop_down.dart';
import '../../../helper_widgets/custom_drop_down_text.dart';


class AssignSubjectByAdminScreen extends StatefulWidget {
  final bool isShow;
   AssignSubjectByAdminScreen({this.isShow=true});

  @override
  State<AssignSubjectByAdminScreen> createState() => _AssignSubjectByAdminScreenState();
}

class _AssignSubjectByAdminScreenState extends State<AssignSubjectByAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.isShow==true?AssignSunject():
    Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Assign Subject To Teacher",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: AssignSunject(),
    )
    ;
  }

}

class AssignSunject extends StatefulWidget {
  const AssignSunject({Key? key}) : super(key: key);

  @override
  State<AssignSunject> createState() => _AssignSunjectState();
}

class _AssignSunjectState extends State<AssignSunject> {
  String selectedTeacher="";
  bool selectedSubject = false;
  List<String> teacherList=[
    "Amir","Asad","Hamza","Danish"];
  String selectedClass="";
  List<String> classList=[
    "One","Two","Three","Four","Five"
  ];
  List multipleSelected = [];
  List subjectListItem = [

    {
      "id": 0,
      "value": false,
      "title": "Physics",
    },
    {
      "id": 1,
      "value": false,
      "title": "English",
    },
    {
      "id": 2,
      "value": false,
      "title": "Chemistry",
    },
    {
      "id": 3,
      "value": false,
      "title": "Biology",
    },
  ];

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
            CustomDropDown(
              child: DropdownButton(
                isExpanded: true,
                underline: SizedBox(),
                hint: Text(selectedTeacher.isEmpty?"Select Teacher":selectedTeacher),
                items: teacherList.map((item){
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item,
                  );
                } ).toList(),
                onChanged: (String? value) {
                  selectedTeacher=value!;
                  setState(() {
                  });
                },
              ),
            ),
            CustomDropDownText(
              text: "Select Class",
            ),
            CustomDropDown(
              child: DropdownButton(
                isExpanded: true,
                underline: SizedBox(),
                hint: Text(selectedClass.isEmpty?"Select Class":selectedClass),
                items: classList.map((item){
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item,
                  );
                } ).toList(),
                onChanged: (String? value) {
                  selectedClass=value!;
                  setState(() {

                  });
                },
              ),
            ),
            CustomDropDownText(
              text: "Select Subject",
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 45.0,
              width: double.infinity,
              margin: EdgeInsets.only(left: 4.0, top: 8.0,right:4.0),
              decoration: BoxDecoration(
                border: Border.all(
                    color: selectedSubject == false ? lightBlackColor : bgColor,
                    width: 1.5),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: InkWell(
                onTap: (){
                  selectedSubject =!selectedSubject;
                  setState(() {

                  });
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
                      "Select Subject",
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
                border: Border.all(
                    color: bgColor,
                    width: 1.5),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: List.generate(
                        subjectListItem.length,
                            (index) => CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            activeColor: bgColor,
                            dense: true,
                            title: Text(
                              subjectListItem[index]["title"],
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            value: subjectListItem[index]["value"],
                            onChanged: (value) {
                              setState(() {
                                subjectListItem[index]["value"] = value;
                                if (multipleSelected.contains(subjectListItem[index])) {
                                  multipleSelected
                                      .remove(subjectListItem[index]);
                                } else {
                                  multipleSelected.add(subjectListItem[index]);
                                };
                              });

                            })),
                  ),

                ],
              ),
            )
                : Container(),
            SizedBox(height: 10,),
            Center(
              child: CustomButton(
                width: 200,
                verticalMargin: 12.0,
                text: "Submit",
                onTap: (){},
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
