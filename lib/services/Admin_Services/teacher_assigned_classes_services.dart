
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/helper_services/custom_post_request_service.dart';
import 'package:school_management_system/providers/get_teacher_assigned_class_provider.dart';

import '../../configs/apis_config.dart';
import '../../models/assigned_class_to_teacher_model.dart';

class TeacherAssignedClassService {
  Future getAssignedClasses({required BuildContext context,required int teacherId})async{
    try{
      Map _body={"teacherId":teacherId};
      var res=await PostRequestService().httpPostRequest(url: getAssignedClassUrl, body: _body, context: context);
      if(res!=null){
        List<GetAssignedClassToTeacherModel> getAssignedClass = (res).map<GetAssignedClassToTeacherModel>((m )=> GetAssignedClassToTeacherModel.fromJson(m)).toList();
        Provider.of<TeacherAssignedClassesProvider>(context,listen: false).updateAssignedClasses(
          newAssignedClass: getAssignedClass
        );
        return getAssignedClass;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Get Assigned Class Service $err");
      return null;
        }
  }
}