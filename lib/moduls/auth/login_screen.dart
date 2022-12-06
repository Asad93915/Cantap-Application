import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/configs/colors.dart';
import 'package:school_management_system/helper_services/custom_loader.dart';
import 'package:school_management_system/helper_services/custom_snackbar.dart';
import 'package:school_management_system/helper_services/navigation_services.dart';
import 'package:school_management_system/helper_widgets/custom_text_field.dart';
import 'package:school_management_system/moduls/admin_modules/admin_home/admin_dashboard.dart';
import 'package:school_management_system/services/login_services.dart';
import '../../configs/text_styles.dart';
import '../../helper_widgets/custom_button.dart';
import '../home/home_dashboard_screen.dart';
import '../principle_module/principle_dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userNameCont=TextEditingController(text: "admin" /*"super.admin"*/);
  TextEditingController _passwordCont=TextEditingController(text: "admin" /*"SuperAdmin@123!"*/);
  FocusNode _nameFocus=FocusNode();
  FocusNode _passwordFocus=FocusNode();

  _loginHandler()async{
    CustomLoader.showLoader(context: context);
    print("In");
    bool res=await LoginApiServices().getLogin(context: context, userName: _userNameCont.text, password: _passwordCont.text);
    print("Out");
    CustomLoader.hideLoader(context);
    print("OutSide");
    if(res){
      NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: AdminDashBoard(),
      //NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeDashboardScreen()
    );

    }
  }
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
              Image.asset("assets/images/app_logo.jpg",height: 100.0,fit: BoxFit.fill,),
              Text("Welcome To SMS!",style: smsStyle,),
              CustomTextField(

                labelText: "UserName",
                controller: _userNameCont,
                inputAction: TextInputAction.next,


              ),
              CustomTextField(
                labelText: "Password",
                controller: _passwordCont,
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
                    // _loginHandler();

                    NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: AdminDashBoard(),
                  );
                },
              )

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
  _validateLogin()async{
    if(_userNameCont.text.isEmpty){
      CustomSnackBar.failedSnackBar(context: context, message: "Enter Valid UserName");
      _nameFocus.requestFocus();
      return false;
    }
    else if(_passwordCont.text.isEmpty){
      CustomSnackBar.failedSnackBar(context: context, message: "Enter Valid Password");
      _passwordFocus.requestFocus();
      return  false;
    }
    else{
      return true;
    }
  }
}
