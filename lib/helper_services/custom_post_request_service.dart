
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart'as http;
import 'package:school_management_system/helper_services/custom_snackbar.dart';

import '../configs/apis_config.dart';
import '../utils/local_storage_services.dart';

class PostRequestService{
  Future httpPostRequest({required String url,required Map body,required BuildContext context})async{
    try{
      print("Ur; $url");
      late var headers;
      if(url=="$baseUrl"+"Authenticate/login"){
        headers={
          "content-Type":"application/json",
        };
      }else{
        print("herree in 2222");
        String token=await LocalStorageServices().getToken()??"";
        headers={
          "content-Type":"application/json",
          "authorization":"Bearer $token"
        };
      }
      print("condition okhy");
      print(headers);
      http.Response response=await http.post(Uri.parse(url),body: json.encode(body),headers: headers);
      print("post request body ${response.body}");
      print("post request status code ${response.statusCode}");
      var jsonDecoded=json.decode(response.body);
      if(jsonDecoded==null){
        CustomSnackBar.failedSnackBar(context: context, message: jsonDecoded['message']);
        return null;
      }
      else{
        // CustomSnackBar.showSnackBar(context: context, message:  jsonDecoded['message']);
        return jsonDecoded;
      }

    }
        catch(err){
      print("Exception in post request service $err");
      return null;
    }
  }
}