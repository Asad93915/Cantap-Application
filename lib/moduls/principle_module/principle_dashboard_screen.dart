import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/configs/text_styles.dart';
import 'package:school_management_system/moduls/principle_module/assign_class_screen.dart';
import 'package:school_management_system/moduls/principle_module/assign_subject_screen.dart';
import 'package:school_management_system/moduls/principle_module/create_teacher_account_screen.dart';
import '../../configs/colors.dart';

class PrincipleDashboardScreen extends StatefulWidget {
  const PrincipleDashboardScreen({Key? key}) : super(key: key);

  @override
  State<PrincipleDashboardScreen> createState() =>
      _PrincipleDashboardScreenState();
}

class _PrincipleDashboardScreenState extends State<PrincipleDashboardScreen> {
  List<Widget> widgets = [
    CreateTeacherScreen(),
    AssignClassScreen(),
    AssignSubjectScreen(),
  ];
  int selectedIndex = 0;

  void onItemTaped(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: selectedIndex == 0
            ? Text(
                "Home Dashboard",
                style: barStyle,
              )
            : selectedIndex == 1
                ? Text(
                    "Assign Subject to Teacher ",
                    style: barStyle,
                  )
                : Text(
                    "Assign Subect to Class",
                    style: barStyle,
                  ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: "Create Teacher"),
          BottomNavigationBarItem(
              icon: Icon(Icons.class_), label: "Assign Class"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book), label: "Assign Subject"),
        ],
        onTap: onItemTaped,
        currentIndex: selectedIndex,
        backgroundColor: bgColor,
        selectedLabelStyle:
            TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        selectedItemColor: whiteColor,
        unselectedItemColor: whiteColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widgets.elementAt(selectedIndex),
            ],
          ),
        ),
      ),
    );
  }
}
