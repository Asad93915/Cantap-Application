

import 'package:flutter/material.dart';
import 'package:school_management_system/configs/colors.dart';
import 'package:school_management_system/moduls/teacher_module/teacher_dashboard_widgets/teacher_view_tutorials.dart';

import '../../../helper_services/custom_loader.dart';
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
    return widget.show?TeacherTutorials():
        Scaffold(
          appBar:   AppBar(
            backgroundColor: bgColor,
            title: Text("Teacher Assign Tutorials",style: TextStyle(
              color: Colors.white
            ),),
          ),
          body: TeacherTutorials(),
        );
  }
}



