import 'package:flutter/cupertino.dart';
import '../models/chpter_Model.dart';

class ChapterListProvider extends ChangeNotifier{
  List<ChaptersList>? chaptersList=[];
  updateChapters({List<ChaptersList>? newChapters}){
    chaptersList=newChapters;
    notifyListeners();
  }
}