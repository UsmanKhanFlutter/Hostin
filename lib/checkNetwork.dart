import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hostin/Screens/login_Page_All.dart';
import 'package:hostin/Global Variables/global_Data.dart'as global;
import 'package:hostin/Screens/selectGender.dart';
Future checkNetwork()async{
  var result= await Connectivity().checkConnectivity();
  if(result==ConnectivityResult.wifi || result==ConnectivityResult.mobile)
  {
    String check=GetStorage().read('UserLogin');
    if(check=='user1'){
      Get.to(selectGender());
    }
    else {
      Get.to(login_Page_All());
    }
  }
  else{
     Get.defaultDialog(
        title: 'Connectivity Error',
        middleText: 'You are not connected to mobile internet or Wifi...',
        backgroundColor: Colors.red,
        barrierDismissible: false,
        titleStyle: TextStyle(fontSize: Get.height*.030,color: Colors.white),
        actions: [
          RaisedButton(
              child: Text('Back',style: TextStyle(color: Colors.black),),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: (){
                SystemNavigator.pop();
              }
          ),
        ]
    );
  }
}