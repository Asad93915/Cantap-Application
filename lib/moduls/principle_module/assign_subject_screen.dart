



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/configs/colors.dart';
import 'package:school_management_system/helper_widgets/custom_button.dart';
import 'package:school_management_system/helper_widgets/custom_drop_down.dart';
import 'package:school_management_system/helper_widgets/custom_drop_down_text.dart';

import '../../configs/text_styles.dart';

class AssignSubjectScreen extends StatefulWidget {
  const AssignSubjectScreen({Key? key}) : super(key: key);

  @override
  State<AssignSubjectScreen> createState() => _AssignSubjectScreenState();
}

class _AssignSubjectScreenState extends State<AssignSubjectScreen> {
  String selectedClass="";
  List<String> classList=["One","Two","Three","Four"];
  bool selectedSubject=false;
  List multipleSelected=[];
  List subjectList=[
    {
      "id": 0,
      "value": false,
      "title": "Urdu",
    },
    {
      "id": 1,
      "value": false,
      "title": "English",
    },
    {
      "id": 0,
      "value": false,
      "title": "Physics",
    },
    {
      "id": 0,
      "value": false,
      "title": "Math",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDropDownText(
            text: "Select Class",
          ),
          CustomDropDown(
            borderColor: selectedClass.isEmpty?false:true,
            child: DropdownButton(
                isExpanded: true,
                underline: SizedBox(),
                hint: Text(selectedClass.isEmpty?"-- Select Class --":selectedClass),
                items: classList.map((item) {
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item,
                  );
                } ).toList(), onChanged: (String? value){
              selectedClass=value!;
              setState(() {

              });
            }
            ),
          ),
            Text(
              "Select Subject",
              style: headerStyle,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 45.0,
              width: double.infinity,
              margin: EdgeInsets.only(left: 4.0,right: 4.0,top: 8.0),
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
                    Icon(selectedSubject == true ? Icons.remove: Icons.add),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Select Subject",
                      style: TextStyle(height: 1.3),
                    ),

                  ],
                ),
              ),
            ),
            selectedSubject==true?
            AnimatedContainer(duration: Duration(microseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              padding: const EdgeInsets.only(
                  left: 30, top: 20, bottom: 20, right: 30),
              decoration: BoxDecoration(
                border: Border.all(
                    color:  bgColor,
                    width: 1.5),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  Column(
                    children: List.generate(
                        subjectList.length
                        ,(index) => CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        activeColor: bgColor,
                        dense: true,
                        title: Text(
                          subjectList[index]["title"],
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        value:subjectList[index]["value"],
                        onChanged: (value){
                          subjectList[index]["value"]=value;
                          setState(() {
                            if (multipleSelected.contains(subjectList[index])) {
                              multipleSelected
                                  .remove(subjectList[index]);
                            } else {
                              multipleSelected.add(subjectList[index]);
                            };
                          });
                        })),
                  ),
                  // Text(
                  //   multipleSelected.isEmpty ? "" : multipleSelected.toString(),
                  //   style: const TextStyle(
                  //     fontSize: 22.0,
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
            ):SizedBox(),
            CustomButton(
              width: double.infinity,
              verticalMargin: 10.0,
              text: "Submit",
              onTap: (){},
              horizontalMargin: 6.0,
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ), ],
      ),
    );
  }
}
