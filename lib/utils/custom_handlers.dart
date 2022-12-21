

import 'package:flutter/cupertino.dart';

import '../helper_services/custom_loader.dart';
import '../services/Admin_Services/get_teachers_list_services.dart';
import '../services/get_classes_service.dart';

getTeachersHandler(BuildContext context)async{
  CustomLoader.showLoader(context: context);
  await GetTeachersListService().getTeachers(context: context, role: "Teacher", schoolId: 1);
  CustomLoader.hideLoader(context);
}
getClassesHandler(BuildContext context)async{
  CustomLoader.showLoader(context: context);
  await GetClassesServices().getClass(context: context);
  CustomLoader.hideLoader(context);
}