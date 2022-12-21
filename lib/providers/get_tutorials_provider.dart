

import 'package:flutter/cupertino.dart';

import '../models/get_tutorials_model.dart';

class GetTutorialsProvider extends ChangeNotifier{
  List<GetTutorialsModel>? getTutorials=[];
  updateTutorials({List<GetTutorialsModel>? newTutorials}){
    getTutorials=newTutorials;
    notifyListeners();
  }

}