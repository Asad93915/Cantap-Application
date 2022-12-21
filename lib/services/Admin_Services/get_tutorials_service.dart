
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/helper_services/custom_post_request_service.dart';
import 'package:school_management_system/models/get_tutorials_model.dart';
import 'package:school_management_system/providers/get_tutorials_provider.dart';

import '../../configs/apis_config.dart';

class GetTutorialsService{
  Future getTutorials({required BuildContext context,required int stdId,required int bookId,required chId,required int sloId})async{
    try{
      Map _body={"standardId":stdId,"bookId":bookId,"chapterId":chId,"sloId":sloId};
      var res=await PostRequestService().httpPostRequest(url: getTutorialsUrl, body: _body, context: context);

      if(res!=null){
        List<GetTutorialsModel> tutorialsModel=(res).map<GetTutorialsModel>((m )=> GetTutorialsModel.fromJson(m)).toList();
        Provider.of<GetTutorialsProvider>(context,listen: false).updateTutorials(
          newTutorials: tutorialsModel
        );
        return true;

      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in get Tutorials Service $err");
      return null;
        }

  }
}