import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/configs/colors.dart';
import 'package:school_management_system/helper_services/custom_loader.dart';
import 'package:school_management_system/helper_services/custom_snackbar.dart';
import 'package:school_management_system/helper_services/navigation_services.dart';
import 'package:school_management_system/helper_widgets/custom_text_field.dart';
import 'package:school_management_system/moduls/teacher_module/teacher_dashboard/teacher_dashboard.dart';
import 'package:school_management_system/services/login_services.dart';
import '../../configs/text_styles.dart';
import '../../helper_widgets/custom_button.dart';
import '../admin_modules/admin_dashboard/admin_dashboard.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _adminNameCont=TextEditingController(
    text: "teacher"
  );
  TextEditingController _adminpaswordCont=TextEditingController(
      text: "teacher"
  );
  FocusNode _adminNameFocus=FocusNode();
  FocusNode _adminpasswordFocus=FocusNode();

  TextEditingController _stdNameCont=TextEditingController(

  );
  TextEditingController _stdPaswordCont=TextEditingController(

  );
  TextEditingController _stdrollNoCont=TextEditingController(

  );
  FocusNode _stdNameFocus=FocusNode();
  FocusNode _stdpasswordFocus=FocusNode();

  _loginHandler()async{
    CustomLoader.showLoader(context: context);
    List<String> list=await LoginApiServices().getLogin(context: context, userName: _adminNameCont.text, password: _adminpaswordCont.text);
    CustomLoader.hideLoader(context);
    if(list.isEmpty){

      CustomSnackBar.failedSnackBar(context: context, message: "Try Again");
    }else{
      if(list[0].contains("Admin"))
      {
        NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: AdminDashBoard(),);
      }else if(list[0].contains("Teacher")){
        NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: TeacherDashBoard(),);
      }else{
        print("role of user $list");
      }
    }

  }
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
           elevation: 0.0,
          flexibleSpace: Image.asset("assets/images/login_top_header.png",fit: BoxFit.fill,),
          backgroundColor: whiteColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset("assets/images/app_logo.jpg",height: 100.0,fit: BoxFit.fill,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: (){
                        selectedIndex=0;
                        setState(() {

                        });

                      },
                      child: Image.asset("assets/images/staff.png",height: 100.0,width: 100.0,fit: BoxFit.fill,)),
                  SizedBox(width: 10.0,),
                  InkWell(
                     onTap: (){
                       selectedIndex=1;
                       setState(() {

                       });
                     },
                      child: Image.asset("assets/images/staff.png",height: 100.0,width: 100.0,fit: BoxFit.fill,)),

                ],
              ),


             if(selectedIndex==0)
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Welcome To STAFF!",style: smsStyle,textAlign: TextAlign.center,),
                  CustomTextField(

                  labelText: "UserName",
                  controller: _adminNameCont,
                  inputAction: TextInputAction.next,


                ),
                  CustomTextField(
                    labelText: "Password",
                    controller: _adminpaswordCont,
                    inputType: TextInputType.visiblePassword,
                  ),
                  TextButton(onPressed: (){
                  }, child: Text("Forgot Your Password",style: TextStyle(color: lightBlackColor,fontSize: 16.0,fontWeight: FontWeight.w600),),),
                  CustomButton(
                    width: double.infinity,
                    text: "Login",
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    verticalMargin: 6.0,
                    onTap: (){
                      if(_validateLogin()){
                        _loginHandler();
                      }
                    },
                  ),],
              ),
              if(selectedIndex==1)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Welcome To STUDENTS!",style: smsStyle,textAlign: TextAlign.center,),
                    CustomTextField(

                    labelText: "UserName",
                    controller: _stdNameCont,
                    inputAction: TextInputAction.next,


                  ),
                    CustomTextField(
                      labelText: "Password",
                      controller: _stdPaswordCont,
                      inputType: TextInputType.visiblePassword,
                    ),
                    CustomTextField(
                      labelText: "Roll Number",
                      controller: _stdrollNoCont,
                      inputType: TextInputType.visiblePassword,
                    ),
                    TextButton(onPressed: (){
                    }, child: Text("Forgot Your Password",style: TextStyle(color: lightBlackColor,fontSize: 16.0,fontWeight: FontWeight.w600),),),
                    CustomButton(
                      width: double.infinity,
                      text: "Login",
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      verticalMargin: 6.0,
                      onTap: (){
                        if(_validateLogin()){
                          _loginHandler();
                        }
                      },
                    ),],
                ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: kToolbarHeight*2.0,
        width: double.infinity,
        child: Image.asset("assets/images/login_bottom_header.png",fit: BoxFit.fill,)
      ),
    );
  }
  _validateLogin(){
    if(_adminNameCont.text.isEmpty){
      CustomSnackBar.failedSnackBar(context: context, message: "Enter Valid UserName");
      _adminNameFocus.requestFocus();
      return false;
    }
    else if(_adminpaswordCont.text.isEmpty){
      CustomSnackBar.failedSnackBar(context: context, message: "Enter Valid Password");
      _adminpasswordFocus.requestFocus();
      return  false;
    }
    else{
      return true;
    }
  }
}
