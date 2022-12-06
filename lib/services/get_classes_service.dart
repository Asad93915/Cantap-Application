
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/helper_services/custom_post_request_service.dart';
import 'package:school_management_system/models/get_classes_model.dart';
import 'package:school_management_system/providers/get_classes_provider.dart';

import '../configs/apis_config.dart';

class GetClassesServices{
  Future getClass({required BuildContext context})async{
    try{
      Map _body={};
      var res=await PostRequestService().httpPostRequest(url: getClassUrl, body: _body, context: context);
      if(res!=null){
        GetClassesModel getClasses=GetClassesModel.fromJson(res);
        Provider.of<GetClassProvider>(context,listen: false).updateClasses(
          newClass: getClasses.result
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Get Class  Service $err");
      return null;
        }
  }
}