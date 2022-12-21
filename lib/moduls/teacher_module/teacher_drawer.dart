import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_management_system/moduls/teacher_module/teacher_dashboard_widgets/teacher_assign_tutorials.dart';
import 'package:school_management_system/moduls/teacher_module/teacher_dashboard_widgets/teacher_home_screen.dart';
import 'package:school_management_system/moduls/teacher_module/teacher_dashboard_widgets/teacher_view_tutorials.dart';

import '../../configs/colors.dart';
import '../../helper_services/navigation_services.dart';
import '../../helper_widgets/custom_drawer_screen.dart';
import '../auth/login_screen.dart';

class TeacherDarwer extends StatefulWidget {
  const TeacherDarwer({Key? key}) : super(key: key);

  @override
  State<TeacherDarwer> createState() => _TeacherDarwerState();
}

class _TeacherDarwerState extends State<TeacherDarwer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: whiteColor,
        height: double.infinity,
        width: MediaQuery.of(context).size.width / 1.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.6,
              height: 70,
              color: bgColor,
            ),
            CustomDrawerScreen(
              title: "Home Screen",
              icon: Icons.home,
              onTap: (){
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: TecherHomeScreen(
                  show: false,
                ));
                setState(() {});
              },
            ),
            CustomDrawerScreen(
              title: "View Tutorials",
              icon: Icons.video_library,
              onTap: (){
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: TecaherViewTutorialsScreen(
                  show: false,
                ));
                setState(() {});
              },
            ),
            CustomDrawerScreen(
              title: "Assign Tutorials",
              icon: Icons.video_library,
              onTap: (){
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: TechaerAssigTutorialsScreen(
                  show: false,
                ));
                setState(() {});
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width / 1.6,
              height: 2,
              color: bgColor,
            ),
            ListTile(
              leading:Icon(Icons.logout,color: Colors.red,),
              title: Text("LogOut",style: TextStyle(color: Colors.red),),
              onTap: (){
                GetStorage().remove('token');
                NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: LoginScreen());
              },
            ),


          ],
        ),
      ),
    );
  }
}
