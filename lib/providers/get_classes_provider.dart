
import 'package:flutter/cupertino.dart';
import 'package:school_management_system/models/get_classes_model.dart';

class GetClassProvider extends ChangeNotifier{
  List<GetClass>?myClass=[];
  updateClasses({List<GetClass>?newClass}){
    myClass=newClass;
    notifyListeners();
  }
}