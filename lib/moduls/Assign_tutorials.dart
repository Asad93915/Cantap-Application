import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/configs/colors.dart';

class AssignTutorialsScreen extends StatefulWidget {
  const AssignTutorialsScreen({Key? key}) : super(key: key);

  @override
  State<AssignTutorialsScreen> createState() => _AssignTutorialsScreenState();
}

class _AssignTutorialsScreenState extends State<AssignTutorialsScreen> {
  String selectedClass="";
  String selectedSeries="";
  String selectedSubject="";
  String selectedChapter="";
  final List<String> _classList = ["One", "Two", "Three", "Four", "Five", "Six"];
  final List<String> _seriesList = [
    "Series-I",
    "Series-II",
    "Series-III",
    "Series-IV"
  ];
  final List<String> _subjectList = ["chemstry", "phy", "Urdu", "English"];
  final List<String> _chapterList = ["Chp-1", "Chp-2", "Chp-3", "Chp-4"];


  bool slo=false;
  List multipleSelected = [];
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Sunday",
    },
    {
      "id": 1,
      "value": false,
      "title": "Monday",
    },
    {
      "id": 2,
      "value": false,
      "title": "Tuesday",
    },
    {
      "id": 3,
      "value": false,
      "title": "Wednesday",
    },
    {
      "id": 4,
      "value": false,
      "title": "Thursday",
    },
    {
      "id": 5,
      "value": false,
      "title": "Friday",
    },
    {
      "id": 6,
      "value": false,
      "title": "Saturday",
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
              "Select Class",
              style: TextStyle(
                  color: blackColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  height: 2.5),
            ),
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
            const Text(
              "Select Series",
              style: TextStyle(
                  color: blackColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  height: 2.5),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6.0),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              height: 45.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: selectedSeries.isEmpty?lightBlackColor:bgColor,
                      width: 1.5
                  )
              ),

              child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text(selectedSeries.isEmpty? "Select Series":selectedSeries),
                  items: _seriesList.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(
                  ), onChanged: (String ? value){

                selectedSeries=value!;
                setState(() {

                });
              }),
            ),
            const Text(
              "Select Subject",
              style: TextStyle(
                  color: blackColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  height: 2.5),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6.0),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              height: 45.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: selectedSubject.isEmpty?lightBlackColor:bgColor,
                      width: 1.5
                  )
              ),

              child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text(selectedSubject.isEmpty? "Select Subject":selectedSubject),
                  items: _subjectList.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(
                  ), onChanged: (String ? value){

                selectedSubject=value!;
                setState(() {

                });
              }),
            ),
            const Text(
              "Select Chapter",
              style: TextStyle(
                  color: blackColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  height: 2.5),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6.0),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              height: 45.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: selectedChapter.isEmpty?lightBlackColor:bgColor,
                      width: 1.5
                  )
              ),

              child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text(selectedChapter.isEmpty? "Select Chapter":selectedChapter),
                  items: _chapterList.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(
                  ), onChanged: (String ? value){

                selectedChapter=value!;
                setState(() {
                });
              }),
            ),
            //for slo's
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              //height: Get.height * 0.16,
              //height: 172,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: slo ? bgColor : null,
                  border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        slo=!slo;
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          slo
                              ? Icon(
                            Icons.remove,
                            color:
                            slo ? Colors.white : Colors.grey[600],
                          )
                              : Icon(
                            Icons.add,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Slo\'s',
                            style: TextStyle(
                              fontSize: 18,
                              color: slo ? Colors.white : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            slo
                ? AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.only(
                  left: 30, top: 20, bottom: 20, right: 30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                // color: Color(0xFFE9EAEA),
              ),
              child: Column(
                children: [
                  Column(
                    children: List.generate(
                      checkListItems.length,
                          (index) => CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: Text(
                          checkListItems[index]["title"],
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        value: checkListItems[index]["value"],
                        onChanged: (value) {
                          setState(() {
                            checkListItems[index]["value"] = value;
                            if (multipleSelected.contains(checkListItems[index])) {
                              multipleSelected.remove(checkListItems[index]);
                            } else {
                              multipleSelected.add(checkListItems[index]);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 64.0),
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
                : const SizedBox(),
            Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    "Vedios",
                    style: TextStyle(
                        color: bgColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        height: 2),
                  ),
                  TextButton(onPressed: (){}, child: const Text(
                    "View All",
                    style: TextStyle(
                        color: bgColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        height: 2),
                  ),)
                ],),),
           Container(
             height: 120,
             padding: EdgeInsets.symmetric(vertical: 5),
              child: Expanded(child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                  primary: false,
                  itemCount:10,
                  itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              })),)
          ],
        ),
      ),
    );
  }
}
