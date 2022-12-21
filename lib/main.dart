import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/moduls/admin_modules/drawer_screens/view_tutorials_screen.dart';
import 'package:school_management_system/providers/class_log_provider.dart';
import 'package:school_management_system/providers/classes_list_provider.dart';
import 'package:school_management_system/providers/get_booklist_provider.dart';
import 'package:school_management_system/providers/get_chapterlist_provider.dart';
import 'package:school_management_system/providers/get_classes_provider.dart';
import 'package:school_management_system/providers/get_teacher_assigned_class_provider.dart';
import 'package:school_management_system/providers/get_teachers_list_provider.dart';
import 'package:school_management_system/providers/get_tutorials_provider.dart';
import 'package:school_management_system/providers/user_date_provider.dart';

import 'moduls/auth/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>UserDataProvider()),
        ChangeNotifierProvider(create: (context)=>GetClassProvider()),
        ///Admin
        ChangeNotifierProvider(create: (context)=>ClassesListProvider()),
        ChangeNotifierProvider(create: (context)=>ClassLogProvider()),
        ChangeNotifierProvider(create: (context)=>GetTeachersListProvider()),
        ChangeNotifierProvider(create: (context)=>TeacherAssignedClassesProvider()),
        ChangeNotifierProvider(create: (context)=>BookListProvoider()),
        ChangeNotifierProvider(create: (context)=>ChapterListProvider()),
        ChangeNotifierProvider(create: (context)=>GetTutorialsProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HomeDashboardScreen(),
        // home: AdminDashBoard(),
        home: LoginScreen(),
      ),
    );
  }
}

