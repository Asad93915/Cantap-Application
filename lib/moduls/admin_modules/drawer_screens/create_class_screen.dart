import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_management_system/configs/colors.dart';
import 'package:school_management_system/configs/text_styles.dart';
import 'package:school_management_system/helper_widgets/custom_button.dart';
import 'package:school_management_system/helper_widgets/custom_drop_down.dart';
import 'package:school_management_system/helper_widgets/custom_drop_down_text.dart';
import 'package:school_management_system/helper_widgets/custom_text_field.dart';
import 'package:school_management_system/moduls/admin_modules/admin_drawer_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AssignTutorials extends StatefulWidget {
  const AssignTutorials({Key? key}) : super(key: key);

  @override
  State<AssignTutorials> createState() => _AssignTutorialsState();
}

class _AssignTutorialsState extends State<AssignTutorials> {
  String selectedClass="";
  String selectedSeries="";
  String selectedSubject="";
  String selectedChapter="";
  String selectesSlos="";

  final List<String> _seriesList = [
    "Series-I",
    "Series-II",
    "Series-III",
    "Series-IV"
  ];
  final List<String> _subjectList = ["chemstry", "phy", "Urdu", "English"];
  final List<String> _chapterList = ["Chp-1", "Chp-2", "Chp-3", "Chp-4"];
  final List<String> _classList = ["One", "Two", "Three", "Four", "Five", "Six"];
  final List<String> _slosList = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday","Sunday"];


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
  int?selectedIndex;
  List<int>?selectedVideos=[];

  List<PickedFile>? imagesList;
  File? imagesFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminDrawer(),
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: Builder(
          builder: (context)=>IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.menu,color: whiteColor,)),
        ),
        title: Text("Assign Tutorils",style: barStyle,),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
          child: Padding(
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
                  CustomDropDown(

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
                  // const Text(
                  //   "Select Series",
                  //   style: TextStyle(
                  //       color: blackColor,
                  //       fontSize: 16.0,
                  //       fontWeight: FontWeight.w700,
                  //       height: 2.5),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 6.0),
                  //   padding: EdgeInsets.symmetric(horizontal: 12.0),
                  //   height: 45.0,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(12.0),
                  //       border: Border.all(
                  //           color: selectedSeries.isEmpty?lightBlackColor:bgColor,
                  //           width: 1.5
                  //       )
                  //   ),
                  //
                  //   child: DropdownButton(
                  //       isExpanded: true,
                  //       underline: SizedBox(),
                  //       hint: Text(selectedSeries.isEmpty? "Select Series":selectedSeries),
                  //       items: _seriesList.map((item) {
                  //         return DropdownMenuItem(
                  //           value: item,
                  //           child: Text(item),
                  //         );
                  //       }).toList(
                  //       ), onChanged: (String ? value){
                  //
                  //     selectedSeries=value!;
                  //     setState(() {
                  //
                  //     });
                  //   }),
                  // ),
                  const Text(
                    "Select Subject",
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        height: 2.5),
                  ),
                  CustomDropDown(

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
                  CustomDropDown(

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
                  CustomDropDownText
                    (
                    text: "Select Sol's",
                  ),
                  //for slo's
                  // Container(
                  //   margin: EdgeInsets.only(top: 5.0),
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 10.0,
                  //   ),
                  //   //height: Get.height * 0.16,
                  //   //height: 172,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //       color: slo ? bgColor : null,
                  //       border: Border.all(color: Colors.grey)),
                  //   child: Column(
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(vertical: 10.0),
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             slo=!slo;
                  //             setState(() {});
                  //           },
                  //           child: Row(
                  //             children: [
                  //               slo
                  //                   ? Icon(
                  //                 Icons.remove,
                  //                 color:
                  //                 slo ? Colors.white : Colors.grey[600],
                  //               )
                  //                   : Icon(
                  //                 Icons.add,
                  //                 color: Colors.grey[600],
                  //               ),
                  //               const SizedBox(
                  //                 width: 15,
                  //               ),
                  //               Text(
                  //                 'Slo\'s',
                  //                 style: TextStyle(
                  //                   fontSize: 18,
                  //                   color: slo ? Colors.white : Colors.grey,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // slo
                  //     ? AnimatedContainer(
                  //   duration: const Duration(milliseconds: 300),
                  //   padding: const EdgeInsets.only(
                  //       left: 30, top: 20, bottom: 20, right: 30),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.grey),
                  //     // color: Color(0xFFE9EAEA),
                  //   ),
                  //   child: Column(
                  //     children: [
                  //       Column(
                  //         children: List.generate(
                  //           checkListItems.length,
                  //               (index) => CheckboxListTile(
                  //             controlAffinity: ListTileControlAffinity.leading,
                  //             contentPadding: EdgeInsets.zero,
                  //             dense: true,
                  //             title: Text(
                  //               checkListItems[index]["title"],
                  //               style: const TextStyle(
                  //                 fontSize: 16.0,
                  //                 color: Colors.black,
                  //               ),
                  //             ),
                  //             value: checkListItems[index]["value"],
                  //             onChanged: (value) {
                  //               setState(() {
                  //                 checkListItems[index]["value"] = value;
                  //                 if (multipleSelected.contains(checkListItems[index])) {
                  //                   multipleSelected.remove(checkListItems[index]);
                  //                 } else {
                  //                   multipleSelected.add(checkListItems[index]);
                  //                 }
                  //               });
                  //             },
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(height: 64.0),
                  //       Text(
                  //         multipleSelected.isEmpty ? "" : multipleSelected.toString(),
                  //         style: const TextStyle(
                  //           fontSize: 22.0,
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                  //     : const SizedBox(),
                  CustomDropDown(

                    child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        hint: Text(selectesSlos.isEmpty? "Select Slo's":selectesSlos),
                        items: _slosList.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(
                        ), onChanged: (String ? value){

                      selectesSlos=value!;
                      setState(() {
                      });
                    }),
                  ),


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
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        primary: false,
                        itemCount:10,
                        itemBuilder: (context,index){
                          return Stack(
                            alignment: Alignment.topRight,
                            children: [
                              InkWell(
                                onTap:(){
                                  selectedVideos!.add(index);
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child:Stack(
                                    children: [
                                      Container(
                                        height: 200.0,
                                        width: double.infinity,
                                        color: Colors.grey,
                                        child: GestureDetector(
                                          onTap: () {
                                            launch("https://www.youtube.com/watch?v=yR9ZW4mS_EA");
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 200,
                                                width: double.infinity,
                                                child: Image.network(
                                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzf4dKcnKHm-M72VvRDEADX6L0JduryUhxhQ&usqp=CAU",
                                                  // MyYoutubeInfo.getThumbnailByUrl(
                                                  //   "https://www.youtube.com/watch?v=yR9ZW4mS_EA",
                                                  // ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                    height: 40.0,
                                                    width: 60.0,
                                                    color: Colors.black.withOpacity(0.3),
                                                    child: Icon(
                                                      CupertinoIcons.play_arrow_solid,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              Container(
                                                color: Colors.black.withOpacity(0.13),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              selectedVideos!.length==0?SizedBox(): isChecked(index)?  Container(
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8.0)
                                ),
                                height: 30.0,
                                width: 30.0,
                                child: Icon(Icons.check,color: bgColor,),

                              ):SizedBox()
                            ],
                          );
                        }),),
                  imagesList!=null?SizedBox(

                    height: 200.0,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: imagesList!.length,
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext,index){
                          return Image.file(
                            File(imagesList![index].path),
                            width: 120.0,
                            height: 150.0,
                          );
                        }),
                  ):SizedBox(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomButton(

                          horizontalMargin: 10.0,
                          verticalMargin: 10.0,
                          onTap: (){
                            _pickedMultiImages();
                            setState(() {

                            });
                          },
                          text: "Upload Images",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                        ),
                      ), Expanded(
                        child: CustomButton(
                          horizontalMargin: 10.0,
                          verticalMargin: 10.0,
                          onTap: (){},
                          text: "Upload Videos",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  bool isChecked(int index){
    bool temp=false;
    for(int i=0; i<selectedVideos!.length;i++){
      if(selectedVideos![i]==index){
        temp= true;

      }
    }
    return temp;
  }
  _pickedMultiImages()async{
    imagesList=(await ImagePicker().getMultiImage());
    if(imagesList!=null){
      imagesFile=await File(imagesList![0].path);
    }
    setState(() {

    });
  }
}
