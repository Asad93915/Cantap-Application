import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_management_system/configs/colors.dart';
import 'package:school_management_system/helper_services/navigation_services.dart';
import 'package:school_management_system/helper_widgets/custom_drawer_screen.dart';
import 'package:school_management_system/moduls/auth/login_screen.dart';
import 'dashboard_widgets/admin_assign_class_to_teeacher_screen.dart';
import 'dashboard_widgets/admin_create_class.dart';
import 'dashboard_widgets/admin_home.dart';
import 'dashboard_widgets/create_teacher_admin.dart';
import 'drawer_screens/view_tutorials_screen.dart';


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
              title: "Home Screen",
              icon: Icons.home,
              onTap: (){
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: AdminHomeScreen(
                  isShow: false,
                ));
                setState(() {});
              },
            ),
            CustomDrawerScreen(
                title: "Create Class",
                icon: Icons.view_compact_alt,
              onTap: (){
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: CreateClassAdminScreen(
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
              title: "Assign Class to Tecaher",
              icon: Icons.subject,
              onTap: (){
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: AssignClassToTeachertByAdminScreen(
                  isShow: false,
                ));
                setState(() {});
              },
            ), CustomDrawerScreen(
              title: "View Tutorials",
              icon: Icons.video_library,
              onTap: (){
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: ViewTutorials(
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
