import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/helper_services/custom_loader.dart';
import 'package:school_management_system/helper_services/navigation_services.dart';
import 'package:school_management_system/models/class_log_model.dart';
import 'package:school_management_system/services/Admin_Services/add_teacher_service.dart';
import 'package:school_management_system/services/Admin_Services/class_log_service.dart';
import 'package:school_management_system/services/Admin_Services/update_class_log_service.dart';
import 'package:school_management_system/services/get_classes_service.dart';
import '../../../configs/colors.dart';
import '../../../configs/text_styles.dart';
import '../../../helper_services/custom_snackbar.dart';
import '../../../helper_widgets/custom_button.dart';
import '../../../helper_widgets/custom_drop_down.dart';
import '../../../helper_widgets/custom_drop_down_text.dart';
import '../../../helper_widgets/custom_text_field.dart';
import '../../../models/classes_list_model.dart';
import '../../../providers/classes_list_provider.dart';
import '../../../services/Admin_Services/classses_list_service.dart';

class CreateClassAdminScreen extends StatefulWidget {
  final bool? isShow;

  CreateClassAdminScreen({Key? key, this.isShow = true});

  @override
  State<CreateClassAdminScreen> createState() => _CreateClassAdminScreenState();
}

class _CreateClassAdminScreenState extends State<CreateClassAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.isShow == true
        ? CrerateClass()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: bgColor,
              title: Text(
                "Create Class",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: CrerateClass(),
          );
  }
}

class CrerateClass extends StatefulWidget {
  const CrerateClass({Key? key}) : super(key: key);

  @override
  State<CrerateClass> createState() => _CrerateClassState();
}

class _CrerateClassState extends State<CrerateClass> {
  String selectedClass = "";
  List<String> classList = ["One", "Two", "Three", "Four", "Five"];
  TextEditingController _userNameCont = TextEditingController();
  TextEditingController _passwordCont = TextEditingController();
  TextEditingController _emailCont = TextEditingController();

  _getClassesHandler()async{
    CustomLoader.showLoader(context: context);
    await ClassesListService().getClasses(context: context);
    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getClassesHandler();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: SingleChildScrollView(
        child: Consumer<ClassesListProvider>(
          builder: (context, getClass, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Std Id#",
                        style: classStyle,
                      ),
                      Text(
                        "Class Name",
                        style: classStyle,
                      ),
                      // Expanded(child: Text("User Name", style: classStyle,), flex: 2,),
                      // Expanded(child: Text("Password", style: classStyle,), flex: 2,),
                      Text(
                        "Action",
                        style: classStyle,
                      )
                    ],
                  ),
                ),
                Divider(),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: getClass.classList!.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext,index){
                  return GetClassesWidget(
                    cls:getClass.classList![index] ,

                  );
                })
              ],
            );
          },
        ),
      ),
    );
  }
}

class GetClassesWidget extends StatelessWidget {
  ClassesList cls;

  GetClassesWidget({required this.cls});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cls.standardId.toString(),
            style: nameStyle,
          ),
          Text(
            "${cls.name ?? ""}",
            style: nameStyle,
          ),
          // Expanded(child: Text("User Name", style: classStyle,), flex: 2,),
          // Expanded(child: Text("Password", style: classStyle,), flex: 2,),
          InkWell(
            onTap: (){
              NavigationServices.goNextAndKeepHistory(context: context, widget: ActionScreen(
                stdId: cls.standardId!,
              ));
            },
            child: Text(
              "Action",
              style: bgStyle,
            ),
          )
        ],
      ),
    );
  }
}

class ActionScreen extends StatefulWidget {
  final int stdId;
   ActionScreen({required this.stdId});

  @override
  State<ActionScreen> createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  TextEditingController _userNameCont = TextEditingController();
  TextEditingController _passwordCont = TextEditingController();
  ClassLogModel? classLog;
  getClassLogHandler()async{
    CustomLoader.showLoader(context: context);
    classLog=  await ClasslogService().getLog(context: context, stndId:widget.stdId );
  if(classLog!=null){
    _userNameCont.text=classLog!.userName??"";
    _passwordCont.text=classLog!.password??"";
  }
    CustomLoader.hideLoader(context);
  }
  _updateClassLogHandler()async{
    CustomLoader.showLoader(context: context);
  bool res=  await UpdateClassLogService().updateClassLog(context: context,
      schlId: classLog!.schoolId!, schlStdId: classLog!.schoolStandardId!,
      userName: _userNameCont.text, password: _passwordCont.text, stndId: widget.stdId);
    CustomLoader.hideLoader(context);
    if(res==true){
      CustomSnackBar.showSnackBar(context: context, message: "Updated Successfully");
      Navigator.pop(context);
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getClassLogHandler();

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text("Perform Action",style: barStyle,),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CustomTextField(
              headerText: "User Name",
              inputType: TextInputType.visiblePassword,
              hintText: "userName",
              controller: _userNameCont,
            ),
            CustomTextField(
              headerText: "Password",
              inputType: TextInputType.visiblePassword,
              hintText: "*****",
              controller: _passwordCont,
            ),
          Center(
              child: CustomButton(
                width: 200,
                verticalMargin: 12.0,
                text: "Update",
                onTap: () {
                  _updateClassLogHandler();
                  setState((){});
                },
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
