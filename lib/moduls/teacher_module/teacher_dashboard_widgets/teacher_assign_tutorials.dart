

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/configs/colors.dart';
import 'package:school_management_system/moduls/teacher_module/teacher_dashboard_widgets/teacher_view_tutorials.dart';

import '../../../configs/text_styles.dart';
import '../../../helper_services/custom_loader.dart';
import '../../../helper_services/navigation_services.dart';
import '../../../helper_widgets/custom_drawer_screen.dart';
import '../../../helper_widgets/custom_drop_down.dart';
import '../../../helper_widgets/custom_drop_down_text.dart';
import '../../../models/chpter_Model.dart';
import '../../../providers/get_booklist_provider.dart';
import '../../../providers/get_chapterlist_provider.dart';
import '../../../providers/get_classes_provider.dart';
import '../../../providers/get_tutorials_provider.dart';
import '../../../services/Admin_Services/books_list_service.dart';
import '../../../services/Admin_Services/chapter_list_service.dart';
import '../../../services/Admin_Services/get_tutorials_service.dart';
import '../../../utils/custom_handlers.dart';
class TechaerAssigTutorialsScreen extends StatefulWidget {
  final bool show;
  TechaerAssigTutorialsScreen({this.show=true});

  @override
  State<TechaerAssigTutorialsScreen> createState() => _TechaerAssigTutorialsScreenState();
}

class _TechaerAssigTutorialsScreenState extends State<TechaerAssigTutorialsScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.show?AssignTutorialClass():
        Scaffold(
          appBar:   AppBar(
            backgroundColor: bgColor,
            title: Text("Teacher Assign Tutorials",style: TextStyle(
              color: Colors.white
            ),),
          ),
          body: AssignTutorialClass(),
        );
  }
}

class AssignTutorialClass extends StatefulWidget {
  const AssignTutorialClass({Key? key}) : super(key: key);

  @override
  State<AssignTutorialClass> createState() => _AssignTutorialClassState();
}

class _AssignTutorialClassState extends State<AssignTutorialClass> {
  int ?selectedClass;
  String selectedSeries="";
  int? selectedSubject;
  int? selectedChapter;
  int ?selectesSlos;
  bool slo=false;
  List multipleSelected = [];

  List<SlOs>slos=[];

  _getBooksHandler(int classId)async{
    CustomLoader.showLoader(context: context);
    await BooksListService().getBooKs(context: context, classId:classId );
    CustomLoader.hideLoader(context);
  }
  _getChapterHandler(int bookId)async{
    CustomLoader.showLoader(context: context);
    await ChaptersListService().getChapters(context: context, bookId: bookId, skip: 0, take: 1000);
    CustomLoader.hideLoader(context);
  }
  _getTutorialsHandler()async{
    CustomLoader.showLoader(context: context);
    await GetTutorialsService().getTutorials(context: context, stdId: selectedClass??0, bookId: selectedSubject??0, chId: selectedChapter??0, sloId: selectesSlos??0);

    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getClassesHandler(context);
      _getTutorialsHandler();
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
              "Select Class",
              style: TextStyle(
                  color: blackColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  height: 2.5),
            ),
            Consumer<GetClassProvider>(builder: (context,classList,_){
              return  CustomDropDown(
                child: DropdownButton(
                  value: selectedClass,
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text("Select Class"),
                  items: classList.myClass!.map((item){
                    return DropdownMenuItem(
                      child: Text(item.name??""),
                      value: item.standardId,
                    );
                  } ).toList(),
                  onChanged: (int? value) {
                    selectedClass=value!;
                    classList.myClass!.map((item) {

                      print("newValue $value");
                      if (value == item.standardId) {
                        if (selectedSubject == null) {
                          _getBooksHandler(item.standardId!);
                        } else {
                          selectedSubject = null;
                          _getBooksHandler(item.standardId!);
                        }
                        // cities.city!.clear();

                      }
                    }).toList();
                    setState(() {

                    });
                  },
                ),
              );
            }),
            const Text(
              "Select Subject",
              style: TextStyle(
                  color: blackColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  height: 2.5),
            ),
            Consumer<BookListProvoider>(builder: (context,subj,_){
              return  CustomDropDown(
                child: DropdownButton(
                  value: selectedSubject,
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text("Select Subject"),
                  items: subj.booksList!.map((item){
                    return DropdownMenuItem(
                      child: Text(item.name??""),
                      value: item.bookId,
                    );
                  } ).toList(),
                  onChanged: (int? value) {
                    selectedSubject=value!;
                    subj.booksList!.map((item) {

                      print("newValue $value");
                      if (value == item.bookId) {
                        if (selectedChapter == null) {
                          _getChapterHandler(item.bookId!);
                        } else {
                          selectedChapter = null;
                          _getChapterHandler(item.bookId!);
                        }
                        // cities.city!.clear();

                      }
                    }).toList();
                    setState(() {});
                  },
                ),
              );
            }),

            Text(
              "Select Chapter",
              style: TextStyle(
                  color: blackColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  height: 2.5),
            ),
            Consumer<ChapterListProvider>(builder: (context,ch,_){
              return       CustomDropDown(

                child: DropdownButton(
                    value: selectedChapter,
                    isExpanded: true,
                    underline: SizedBox(),
                    hint: Text( "Select Chapter"),
                    items: ch.chaptersList!.toSet().map((item) {
                      return DropdownMenuItem(
                        value: item.chapterId,
                        child: Text(item.name!),
                      );
                    }).toSet().toList(
                    ), onChanged: (int? value){

                  selectedChapter=value!;
                  ch.chaptersList!.map((item){
                    if (value == item.chapterId) {
                      if (selectedChapter == null) {
                        slos=item.slOs!;
                      } else {
                        slos.clear();
                        selectesSlos=null;
                        slos=item.slOs!;
                      }
                      // cities.city!.clear();

                    }
                  }).toList();

                  setState(() {
                  });
                }),
              );
            }),

            CustomDropDownText
              (
              text: "Select Sol's",
            ),
            CustomDropDown(
              child: DropdownButton(
                  value: selectesSlos,
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text( "Select Slo's"),
                  items: slos.toSet().map((item) {
                    return DropdownMenuItem(
                      value: item.sloId,
                      child: Text(item.name??""),
                    );
                  }).toSet().toList(
                  ), onChanged: (int ? value){

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

            Consumer<GetTutorialsProvider>(builder: (context,tutorial,_){
              return SizedBox(

                height: 120.0,
                width: double.infinity,

                child: tutorial.getTutorials!.isNotEmpty?ListView.builder(
                    itemCount: tutorial.getTutorials!.length<10?tutorial.getTutorials!.length:10,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: false,
                    physics: AlwaysScrollableScrollPhysics(),

                    itemBuilder: (BuildContext,index){
                      return InkWell(
                        onTap: (){

                          NavigationServices.goNextAndKeepHistory(context: context, widget: VideoPlayerScreen(youtubeUrl: tutorial.getTutorials![index].youtubeLink??"",));
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              alignment: Alignment.center,
                              height:MediaQuery.of(context).size.height * 0.17,
                              width: MediaQuery.of(context).size.width/1.8,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8lJWvCdGtyLav41mHkWYZVGOyT_ZfF2nFotVKQ2zwKBu5KTvJPux2Ai2Axq3E4t90KPw&usqp=CAU",),
                                    fit: BoxFit.cover,

                                    alignment: Alignment.center,

                                  ),
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Text("gQDByCdjUXw",style: videoStyle,textAlign: TextAlign.center,),
                            ),
                            Container(
                              height:30.0,
                              width:40.0,
                              child: Icon(Icons.play_arrow,color: whiteColor,size: 25.0,),
                              decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                            )
                          ],
                        ),
                      );
                    }):Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: blackColor)
                    ),
                    child: Text("No Tutorials exsist against this Content",textAlign: TextAlign.center,style: createStyle,)),
              );
            })

          ],
        ),
      ),


    );
  }
}




