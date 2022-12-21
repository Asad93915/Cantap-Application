
import 'package:flutter/cupertino.dart';

import '../models/get_teachers_list_model.dart';

class GetTeachersListProvider extends ChangeNotifier{
  List<GetTeachersListModel>? teachersList=[];
  updateTeachers({List<GetTeachersListModel>? newTeachers}){
    teachersList=newTeachers;
    notifyListeners();
  }

}