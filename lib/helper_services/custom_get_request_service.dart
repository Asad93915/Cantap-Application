import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:school_management_system/helper_services/custom_snackbar.dart';
class GetRequestService{
  Future httpGetRequest({required String url,required  BuildContext context})async{
    print("get request Url $url");
    try{
      http.Response response=await http.get(Uri.parse(url));
      print("get request status code ${response.statusCode}");
      print("get request body ${response.body}");

      var jsonDecoded=json.decode(response.body);
      if(response.statusCode !=200){
        CustomSnackBar.failedSnackBar(context: context, message: jsonDecoded['message']);
        return null;
      }
      else{
        return jsonDecoded;
      }
    }
        catch(err){
      print("exception in custom get request service $err");
      return null;
        }

  }
}