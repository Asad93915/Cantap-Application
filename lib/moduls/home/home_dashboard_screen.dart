import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/configs/colors.dart';
import 'package:school_management_system/moduls/Assign_tutorials.dart';
import 'package:school_management_system/moduls/classes/create_class.dart';
import 'package:school_management_system/moduls/classes/get_class_screen.dart';
import '../../helper_services/custom_loader.dart';
import '../../services/get_classes_service.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({Key? key}) : super(key: key);

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  int selectedIndex = 0;
  _dashboardHandler()async{
    CustomLoader.showLoader(context: context);
    await GetClassesServices().getClass(context: context);
    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _dashboardHandler();
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return await showCupertinoModalPopup(
            context: context,
            builder: (context) => Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Do you want to close your application?',
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    Divider(),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No')),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Yes')),
                      ],
                    )
                  ]),
                ),
              ),
            ));
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: whiteColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(selectedIndex==0)
                    GetClassScreen(),
                  if(selectedIndex==1)
                    CreateClassScreen(),
                  if(selectedIndex==2)
                  AssignTutorialsScreen(),
                  if(selectedIndex==3)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("need to Implement This screen"),
                      ],
                    ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            //bottom navigation bar on scaffold
            color: bgColor,
            shape: CircularNotchedRectangle(),
            //shape of notch
            notchMargin: 5,
            //notche margin between floating button and bottom appbar
            child: Row(
              //children inside bottom appbar
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    selectedIndex = 0;
                    setState(() {});
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    selectedIndex = 1;
                    setState(() {});
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.print,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    selectedIndex = 2;
                    setState(() {});
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    selectedIndex = 3;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
