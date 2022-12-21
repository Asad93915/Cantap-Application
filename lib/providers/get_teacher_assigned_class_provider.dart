
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/assigned_class_to_teacher_model.dart';

class TeacherAssignedClassesProvider extends ChangeNotifier{
  List<GetAssignedClassToTeacherModel>? assignedClass=[];
  updateAssignedClasses({List<GetAssignedClassToTeacherModel>? newAssignedClass}){
    assignedClass=newAssignedClass;
    notifyListeners();
  }

}