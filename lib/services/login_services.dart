
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/configs/apis_config.dart';
import 'package:school_management_system/helper_services/custom_post_request_service.dart';
import 'package:school_management_system/helper_services/local_storage.dart';
import 'package:school_management_system/models/user_model.dart';
import 'package:school_management_system/providers/user_date_provider.dart';

class LoginApiServices{
  Future getLogin({required BuildContext context,required String userName,required String password})async{
    try{
      Map _body={"username":userName,"password":password};
      print(_body);
      var  res=await  PostRequestService().httpPostRequest(url: loginUrl, body: _body, context: context);
      if(res!=null){
        UserResponseModel userModel=UserResponseModel.fromJson(res);
        Provider.of<UserDataProvider>(context,listen: false).updateUserData(
          newUser: userModel.user
        );
        String token=userModel.token!;
        await LocalStorageServices().saveToken(token);
        return userModel.userRoles;
      }
      else{
        print("response is null");
        return  [];
      }
    }
    catch(err){
      print("Exception in Login Service $err");
      return [];
    }
  }
}