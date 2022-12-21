
import 'package:flutter/cupertino.dart';

import '../models/class_log_model.dart';

class ClassLogProvider extends ChangeNotifier{
  ClassLogModel ? classLog;
  updateClassLog({ClassLogModel ? newClassLog}){
    classLog=newClassLog;
    notifyListeners();
  }
}