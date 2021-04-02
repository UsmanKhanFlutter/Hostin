import 'package:easy_onboarding/easy_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hostin/Global Variables/global_Data.dart'as global;
import 'package:hostin/Widgets/totorialScreenWidget.dart';
class totorialScreen extends StatefulWidget {
  @override
  _totorialScreenState createState() => _totorialScreenState();
}
class _totorialScreenState extends State<totorialScreen> {
  @override
  Widget build(BuildContext context) {
    return EasyOnboarding(
      onStart: () {
        print("getting started ");
        print(GetStorage().read('Uid'));
        print(GetStorage().read('Gender'));
        print(GetStorage().read('WardenStudent'));
      },
      skipButtonColor: Color(0xffF2F2F0),
      backButtonColor: Color(0xffF2F2F0),
      nextButtonColor: Color(0xffF2F2F0),
      backgroundColor: Color(0xffF2F2F0),
      indicatorSelectedColor: Color(0xffFFC452),
      indicatorUnselectedColor: Colors.black,
      startButtonColor: Color(0xffFFC452),
      nextButtonIcon: Text(
        'NEXT',
        style: TextStyle(fontSize: global.height*.02, color: Colors.black,fontWeight: FontWeight.bold),
      ),
      skipButtonText: Text(
        'SKIP',
        style: TextStyle(fontSize: global.height*.02, color: Color(0xffFFC452),fontWeight: FontWeight.bold),
      ),
      startButtonText: Text(
        'GETTING STARTED',
        style: TextStyle(
          color: Colors.white,
          fontSize: global.height*.02,
        ),
      ),
      bottomBackgroundColor: Color(0xffF2F2F0),
      backButtonIcon: Text('BACK',
        style: TextStyle(fontSize: global.height*.02, color: Color(0xffFFC452),fontWeight: FontWeight.bold),),
      children: [
        Container(
          height: global.height,
          width: global.width,
          color: Color(0xffF2F2F0),
          child: totorialScreenWidget("assests/Images/tutorial-1.png","Welcome","Boys and Girls hostels are \n available for you at \none place"),
        ),
        Container(
          height: global.height,
          width: global.width,
          color: Color(0xffF2F2F0),
          child: totorialScreenWidget("assests/Images/hostIn.png","Fast Search","Boys and Girls hostels are \n available for you at \none place"),
        ),
        Container(
          height: global.height,
          width: global.width,
          color: Color(0xffF2F2F0),
          child: totorialScreenWidget("assests/Images/tutorial-4.png","Schedule Visit","Get Contact details of hostels \n & visit on your desired day"),
        ),
        Container(
          height: global.height,
          width: global.width,
          color: Color(0xffF2F2F0),
          child: totorialScreenWidget("assests/Images/tutorial-3.png","Visit & Book your hostel","Confirm your hostel through\n HostIn and move in"),
        ),

      ],
    );
  }
}
