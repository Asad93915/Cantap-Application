import 'package:flutter/material.dart';
import 'package:school_management_system/configs/colors.dart';
import 'package:school_management_system/helper_services/navigation_services.dart';
import 'package:school_management_system/helper_widgets/custom_drawer_screen.dart';
import 'package:school_management_system/moduls/admin_modules/dashboard_widgets/admin_assign_tutorials_screen.dart';
import 'package:school_management_system/moduls/admin_modules/dashboard_widgets/create_admin.dart';
import 'package:school_management_system/moduls/admin_modules/dashboard_widgets/create_class.dart';
import 'package:school_management_system/moduls/admin_modules/dashboard_widgets/create_teacher_admin.dart';
import 'package:school_management_system/moduls/admin_modules/drawer_screens/create_class_screen.dart';
import 'package:school_management_system/moduls/auth/login_screen.dart';


class AdminDrawer extends StatefulWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
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
                title: "Create Class",
                icon: Icons.view_compact_alt,
              onTap: (){
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: CreateClassScreen(
                  isShow: false,
                ));
                setState(() {});
              },
            ),
            CustomDrawerScreen(
              title: "Create Teacher",
              icon: Icons.person,
              onTap: (){
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: CreateTeacherByAdminScreen(
                  isShow: false,
                ));
                setState(() {});
              },
            ),
            CustomDrawerScreen(
              title: "Assign Subject to ecaher",
              icon: Icons.subject,
              onTap: (){
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: AssignSubjectByAdminScreen(
                  isShow: false,
                ));
                setState(() {});
              },
            ), CustomDrawerScreen(
              title: "View Tutorils",
              icon: Icons.video_library,
              onTap: (){
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: AdminTutorialsScreen(
                  isShow: false,
                ));
                setState(() {});
              },
            ), CustomDrawerScreen(
              title: "Assign Tutorials",
              icon: Icons.video_library,
              onTap: (){
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(context: context, widget: AssignTutorials());
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
          NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: LoginScreen());
        },
      ),


          ],
        ),
      ),
    );
  }
}
