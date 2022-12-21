
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/helper_services/custom_post_request_service.dart';
import 'package:school_management_system/models/get_teachers_list_model.dart';

import '../../configs/apis_config.dart';
import '../../providers/get_teachers_list_provider.dart';

class GetTeachersListService {
  Future getTeachers({required BuildContext context,required String role,required int schoolId})async{
    try{
      Map _body={"role":role,"schoolId":schoolId};
      var res=await PostRequestService().httpPostRequest(url: getTeachersListUrl, body: _body, context: context);
      if(res!=null){
        List<GetTeachersListModel> teachersList = (res).map<GetTeachersListModel>((m )=> GetTeachersListModel.fromJson(m)).toList();
        Provider.of<GetTeachersListProvider>(context,listen: false).updateTeachers(
          newTeachers: teachersList
        );
        return true;

      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Get Teachers List Service $err");
      return null;
        }
  }
}