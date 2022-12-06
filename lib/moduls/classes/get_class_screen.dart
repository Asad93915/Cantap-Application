import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/moduls/classes/get_class_widget.dart';
import 'package:school_management_system/providers/get_classes_provider.dart';

class GetClassScreen extends StatefulWidget {
  const GetClassScreen({Key? key}) : super(key: key);

  @override
  State<GetClassScreen> createState() => _GetClassScreenState();
}

class _GetClassScreenState extends State<GetClassScreen> {

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/create_class.png"),
          Consumer<GetClassProvider>(builder: (context,getClass,_){
              return ListView.builder(
                  itemCount: getClass.myClass!.length,
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext,index){
                return GetClassWidget(classes: getClass.myClass![index]);
              });
            },
          ),
        ],
      ),
    );
  }
}
