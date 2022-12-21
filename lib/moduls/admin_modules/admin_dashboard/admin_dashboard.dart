import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/configs/colors.dart';
import 'package:school_management_system/configs/text_styles.dart';
import 'package:school_management_system/moduls/admin_modules/admin_drawer_screen.dart';
import 'package:school_management_system/moduls/admin_modules/dashboard_widgets/create_teacher_admin.dart';
import '../dashboard_widgets/admin_assign_class_to_teeacher_screen.dart';
import '../dashboard_widgets/admin_create_class.dart';
import '../dashboard_widgets/admin_home.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({Key? key}) : super(key: key);

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  List<Widget> widgets=[
    AdminHomeScreen(),
    CreateClassAdminScreen(),
    CreateTeacherByAdminScreen(),
    AssignClassToTeachertByAdminScreen()
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminDrawer(),
      appBar:selectedIndex==0? AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu))),
        backgroundColor: bgColor,
        title: Text("Home",style: barStyle,),
        centerTitle: true,
      ):selectedIndex==1? AppBar(
        backgroundColor: bgColor,
        title: Text("Class Account",style: barStyle,),
        centerTitle: true,
      ):selectedIndex==2? AppBar(
        backgroundColor: bgColor,
        title: Text("Create Teacher",style: barStyle,),
        centerTitle: true,
      ): AppBar(
        backgroundColor: bgColor,
        title: Text("Assign Claas To Teacher",style: barStyle,),
        centerTitle: true,

      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.view_compact_alt),label: "Class Account",),
          BottomNavigationBarItem(icon: Icon(Icons.person_add),label: "Add Teacher",),
          BottomNavigationBarItem(icon: Icon(Icons.subject),label: "Assign Class",),
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
