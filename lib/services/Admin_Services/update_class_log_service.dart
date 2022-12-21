
import 'package:flutter/cupertino.dart';
import 'package:school_management_system/helper_services/custom_post_request_service.dart';

import '../../configs/apis_config.dart';

class UpdateClassLogService{
  Future updateClassLog({required BuildContext context,required int schlId,required schlStdId,required String userName,required String password,required int stndId})async{
    try{
      Map _body={
        "schoolStandardId": schlStdId,
        "schoolId": schlId,
        "userName": userName,
        "password": password,
        "standardId": stndId};
      var res=await PostRequestService().httpPostRequest(url: updateClassLogUrl, body: _body, context: context);
      if(res!=null){
        print("Updated Successfully");
        return res??false;
      }
      else{
        return false;
      }

    }
        catch(err){
      print("Exception in UpdateClassLogService $err");
      return false;
        }
  }
}