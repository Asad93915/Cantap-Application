

import 'package:flutter/cupertino.dart';
import 'package:school_management_system/models/user_model.dart';

class UserDataProvider extends ChangeNotifier{
  UserModel?  user;
  updateUserData({UserModel?  newUser}){
    user=newUser;
    notifyListeners();
  }
}