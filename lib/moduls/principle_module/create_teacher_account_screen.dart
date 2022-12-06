import 'package:flutter/material.dart';
import 'package:school_management_system/configs/colors.dart';
import 'package:school_management_system/helper_widgets/custom_text_field.dart';

import '../../configs/text_styles.dart';
import '../../helper_widgets/custom_drop_down_text.dart';

class CreateTeacherScreen extends StatefulWidget {
  const CreateTeacherScreen({Key? key}) : super(key: key);

  @override
  State<CreateTeacherScreen> createState() => _CreateTeacherScreenState();
}

class _CreateTeacherScreenState extends State<CreateTeacherScreen> {
  String? selectedGender;
  bool selectedClass = false;
  List multipleSelected = [];
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
            inputAction: TextInputAction.next,
          ),
          CustomTextField(
            headerText: "Phone Number",
            inputType: TextInputType.phone,
            inputAction: TextInputAction.next,
          ),
          CustomTextField(
            headerText: "User Name",
            inputAction: TextInputAction.next,
          ),
          CustomTextField(
            headerText: "Password",
            inputType: TextInputType.visiblePassword,
            inputAction: TextInputAction.next,
          ),
          CustomTextField(
            headerText: "Qualification",
            inputAction: TextInputAction.next,
          ),
          CustomDropDownText(
            text: "Gender",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: RadioListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                    title: Text("Male"),
                    value: '0',
                    activeColor: bgColor,
                    groupValue: selectedGender,
                    onChanged: (String? value) {
                      selectedGender = value;
                      setState(() {});
                    }),
              ),
              Expanded(
                child: RadioListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                    title: Text("Female"),
                    value: '1',
                    activeColor: bgColor,
                    groupValue: selectedGender,
                    onChanged: (String? value) {
                      selectedGender = value;
                      setState(() {});
                    }),
              ),
            ],
          ),
          Text(
            "Select Class",
            style: headerStyle,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            height: 45.0,
            width: double.infinity,
            margin: EdgeInsets.only(left: 4.0, top: 8.0,right:4.0),
            decoration: BoxDecoration(
              border: Border.all(
                  color: selectedClass == false ? lightBlackColor : bgColor,
                  width: 1.5),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              onTap: (){
                selectedClass =!selectedClass;
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
                    "Select Class",
                    style: TextStyle(height: 1.26),
                  ),
                ],
              ),
            ),
          ),
          selectedClass == true
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
                            classListItem.length,
                            (index) => CheckboxListTile(
                                controlAffinity: ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                                activeColor: bgColor,
                                dense: true,
                                title: Text(
                                  classListItem[index]["title"],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                                value: classListItem[index]["value"],
                                onChanged: (value) {
                                setState(() {
                                  classListItem[index]["value"] = value;
                                  if (multipleSelected.contains(classListItem[index])) {
                                    multipleSelected
                                        .remove(classListItem[index]);
                                  } else {
                                    multipleSelected.add(classListItem[index]);
                                  };
                                });

                                })),
                      ),
                      Text(
                        multipleSelected.isEmpty ? "" : multipleSelected.toString(),
                        style: const TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
