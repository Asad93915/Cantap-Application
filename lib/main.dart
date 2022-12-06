import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/moduls/admin_modules/admin_home/admin_dashboard.dart';
import 'package:school_management_system/moduls/home/home_dashboard_screen.dart';
import 'package:school_management_system/moduls/principle_module/principle_dashboard_screen.dart';
import 'package:school_management_system/providers/get_classes_provider.dart';
import 'package:school_management_system/providers/user_date_provider.dart';

import 'moduls/auth/login_screen.dart';

void main() {
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
        ChangeNotifierProvider(create: (context)=>GetClassProvider())
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

