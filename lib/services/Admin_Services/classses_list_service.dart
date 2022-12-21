
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/helper_services/custom_post_request_service.dart';
import 'package:school_management_system/models/classes_list_model.dart';
import 'package:school_management_system/providers/classes_list_provider.dart';

import '../../configs/apis_config.dart';

class ClassesListService{
  Future getClasses({required BuildContext context})async{
    try{
      Map _body={};
      var res=await PostRequestService().httpPostRequest(url: getClassesUrl, body: _body, context: context);

      if(res!=null){

        ClassesListModel classesList=ClassesListModel.fromJson(res);
        Provider.of<ClassesListProvider>(context,listen: false).updateClasses(
          newClassList: classesList.result
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in get Classes Service $err");
      return null;
        }
  }
}