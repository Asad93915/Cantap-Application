
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices{

  Future saveToken(String token)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString('token', token);
    return true;

}
Future getToken()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
   String? token=await pref.getString('token');
   return token;
}
}