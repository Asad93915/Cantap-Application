import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/configs/colors.dart';
import 'package:school_management_system/configs/text_styles.dart';
import '../teacher_dashboard_widgets/teacher_assign_tutorials.dart';
import '../teacher_dashboard_widgets/teacher_home_screen.dart';
import '../teacher_dashboard_widgets/teacher_view_tutorials.dart';
import '../teacher_drawer.dart';

class TeacherDashBoard extends StatefulWidget {
  const TeacherDashBoard({Key? key}) : super(key: key);
  @override
  State<TeacherDashBoard> createState() => _TeacherDashBoardState();
}

class _TeacherDashBoardState extends State<TeacherDashBoard> {
  List<Widget> widgets=[
    TecherHomeScreen(),
    TecaherViewTutorialsScreen(),
    TechaerAssigTutorialsScreen(),
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TeacherDarwer(),
      appBar:selectedIndex==0? AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu))),
        backgroundColor: bgColor,
        title: Text("Home",style: barStyle,),
        centerTitle: true,
      ):selectedIndex==1? AppBar(
        backgroundColor: bgColor,
        title: Text("View Tutorials",style: barStyle,),
        centerTitle: true,
      ): AppBar(
        backgroundColor: bgColor,
        title: Text("Assign Tutorials",style: barStyle,),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.video_library),label: "View Tutorials",),
          BottomNavigationBarItem(icon: Icon(Icons.video_library),label: "Assign Tutorials",),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTaped,
        backgroundColor: bgColor,
        selectedItemColor: whiteColor,
        unselectedItemColor: whiteColor,
        selectedLabelStyle: TextStyle(
            color: whiteColor,fontWeight: FontWeight.bold
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widgets.elementAt(selectedIndex),
          ],
        ),
      ),

    );
  }

  void onItemTaped(int index) {
    selectedIndex=index;
    setState(() {});
  }
}
