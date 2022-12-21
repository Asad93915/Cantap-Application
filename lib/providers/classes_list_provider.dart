
import 'package:flutter/cupertino.dart';

import '../models/classes_list_model.dart';

class ClassesListProvider extends ChangeNotifier{
  List<ClassesList>? classList=[];
  updateClasses({List<ClassesList>? newClassList}){
    classList=newClassList;
    notifyListeners();
  }
}