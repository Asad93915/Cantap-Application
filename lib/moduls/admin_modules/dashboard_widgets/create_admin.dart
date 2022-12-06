

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../configs/colors.dart';
import '../../../helper_widgets/custom_drop_down.dart';
import '../../../helper_widgets/custom_drop_down_text.dart';

class AdminTutorialsScreen extends StatefulWidget {
  final bool isShow;
  const AdminTutorialsScreen({this.isShow=true});
  @override
  State<AdminTutorialsScreen> createState() => _AdminTutorialsScreenState();
}

class _AdminTutorialsScreenState extends State<AdminTutorialsScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.isShow==true?ViewTutorials():
    Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Rider screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ViewTutorials(),
    )
    ;
  }

}


class ViewTutorials extends StatefulWidget {
  const ViewTutorials({Key? key}) : super(key: key);

  @override
  State<ViewTutorials> createState() => _ViewTutorialsState();
}

class _ViewTutorialsState extends State<ViewTutorials> {
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
                    return  Container(
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
                                      fit: BoxFit.fill,
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
                    );
                  }),),
          ],
        ),
      ),
    );
  }
}
