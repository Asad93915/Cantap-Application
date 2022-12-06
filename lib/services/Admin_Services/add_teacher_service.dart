import 'package:flutter/material.dart';
import 'package:school_management_system/helper_services/custom_post_request_service.dart';

import '../../configs/apis_config.dart';

class AddTeachersService {
  Future AddTeacher(
      {required BuildContext context,
      required String teacherName,
      required String email,
      required String userName,
      required String password,
      required String imageUrl,
      required String role,
      required String phoneNo,
      required String about,
      required int schoolId
      }) async {
    try {
      Map _body = {
        "name": teacherName,
        "email": email,
        "password": password,
        "username": userName,
        "imageUrl": imageUrl,
        "role": role,
        "schoolId":schoolId,
        "phoneNumber": phoneNo,
        "about": about,
      };
      var res=await PostRequestService().httpPostRequest(url: adminCreateClassUrl, body: _body, context: context);
      if(res!=null){
        print("Class Created Successfully");
        return true;
      }
      else{
        return null;
      }
    } catch (err) {
      print("Objection in Create Class Service $err");
      return null;
    }
  }
}
