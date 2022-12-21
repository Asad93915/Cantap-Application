
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/helper_services/custom_post_request_service.dart';
import 'package:school_management_system/models/classes_list_model.dart';
import 'package:school_management_system/providers/classes_list_provider.dart';

import '../../configs/apis_config.dart';
import '../../models/books_model.dart';
import '../../providers/get_booklist_provider.dart';

class BooksListService{
  Future getBooKs({required BuildContext context,required int classId})async{
    try{
      Map _body={
        "id":classId
      };
      var res=await PostRequestService().httpPostRequest(url: getBooksUrl, body: _body, context: context);
      if(res!=null){
        print("response");
        BooksModel booksList=BooksModel.fromJson(res);
        Provider.of<BookListProvoider>(context,listen: false).updateBooks(
          newBooks: booksList.result
        );
        return true;
      }
      else{
        return null;
      }
    }
    catch(err){
      print("Exception in get Books Service $err");
      return null;
    }
  }
}