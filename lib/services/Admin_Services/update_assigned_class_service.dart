
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:school_management_system/helper_services/custom_post_request_service.dart';

import '../../configs/apis_config.dart';
import 'package:http/http.dart'as http;
import '../../helper_services/custom_snackbar.dart';
import '../../helper_services/local_storage.dart';
import '../../models/assigned_class_to_teacher_model.dart';

class updateAssignedClassService {
  Future updateAssignedClass({required BuildContext context,required List<GetAssignedClassToTeacherModel> list})async{
    try{
      print("Ur; $updateAssignedClassUrl");
      String token=await LocalStorageServices().getToken()??"";

  var    headers={
        "content-Type":"application/json",
        "authorization":"Bearer $token"
      };
  var _body=list;

      print("condition okhy");

      http.Response response=await http.post(Uri.parse(updateAssignedClassUrl),body:json.encode(list),headers: headers);
      print("post request body ${response.body}");
      print("post request status code ${response.statusCode}");
      var jsonDecoded=json.decode(response.body);
      if(jsonDecoded==null){
        // CustomSnackBar.failedSnackBar(context: context, message: jsonDecoded['message']);
        return false;
      }
      else{

        // CustomSnackBar.showSnackBar(context: context, message:  jsonDecoded['message']);
        return true;
      }

    }
    catch(err){
      print("Exception in podfdfst request service $err");
      return false;
    }
  }
}