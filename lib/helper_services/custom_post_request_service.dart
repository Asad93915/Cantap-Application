
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:school_management_system/helper_services/custom_snackbar.dart';

class PostRequestService{
  Future httpPostRequest({required String url,required Map body,required BuildContext context})async{
    print("calling"); print("post request url $url");
    try{

      String token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJqdGkiOiI3NDY0OWIxZi1jZGRmLTQ3ZjAtOWE4Ni1jNWQ3YWRkNjNiMDgiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBZG1pbiIsImV4cCI6MTY3MjkwMDk1MCwiaXNzIjoiaHR0cHM6Ly9hcGkuaW1wbGllc3NvbHV0aW9ucy5jb20vIiwiYXVkIjoiaHR0cHM6Ly9pbXBsaWVzc29sdXRpb25zLmNvbS8ifQ.SKN7whrEEPLktKbfxz7UJv_2rxyEt1M122Dyj7QUB1g";
      var headers={
        "content-Type":"application/json",
        "authorization":"Bearer $token"
      };
      http.Response response=await http.post(Uri.parse(url),body: json.encode(body),headers: headers);
      print("post request body ${response.body}");
      print("post request status code ${response.statusCode}");

      var jsonDecoded=json.decode(response.body);
      if(jsonDecoded==null){
        CustomSnackBar.failedSnackBar(context: context, message: jsonDecoded['message']);
        return null;
      }
      else{
        CustomSnackBar.showSnackBar(context: context, message:  jsonDecoded['message']);
        return jsonDecoded;
      }

    }
        catch(err){
      print("Exception in post request service $err");
      return null;

        }
  }
}