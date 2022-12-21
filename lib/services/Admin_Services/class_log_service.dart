

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/helper_services/custom_post_request_service.dart';
import 'package:school_management_system/models/class_log_model.dart';
import 'package:school_management_system/providers/class_log_provider.dart';

import '../../configs/apis_config.dart';

class ClasslogService{
  Future getLog({required BuildContext context,required int stndId})async{
    try{
      Map _body={"standardId":stndId};
      var res=await PostRequestService().httpPostRequest(url: getClassLogUrl, body:_body , context: context);
      if(res!=null){
        ClassLogModel classLog=ClassLogModel.fromJson(res);
        Provider.of<ClassLogProvider>(context,listen: false).updateClassLog(
          newClassLog: classLog
        );
        return classLog;
      }
      else{
        return null;
      }

    }
        catch(err){
      print("Exception in class log service $err");
      return null;
        }
  }
}