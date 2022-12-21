
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/helper_services/custom_post_request_service.dart';
import 'package:school_management_system/models/chpter_Model.dart';
import 'package:school_management_system/models/classes_list_model.dart';
import 'package:school_management_system/providers/classes_list_provider.dart';

import '../../configs/apis_config.dart';
import '../../models/books_model.dart';
import '../../providers/get_booklist_provider.dart';
import '../../providers/get_chapterlist_provider.dart';

class ChaptersListService{
  Future getChapters({required BuildContext context,required int bookId,required int skip,required int take})async{
    try{
      Map _body={
        "bookId": bookId,
        "skip": skip,
        "take": take
      };
      var res=await PostRequestService().httpPostRequest(url: getChaptersUrl, body: _body, context: context);
      if(res!=null){
      ChapterModel chaptersList=ChapterModel.fromJson(res);
        Provider.of<ChapterListProvider>(context,listen: false).updateChapters(
          newChapters: chaptersList.result
        );
        return true;
      }
      else{
        return null;
      }
    }
    catch(err){
      print("Exception in get ChapterList Service $err");
      return null;
    }
  }
}