import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:hostin/Global Variables/global_Data.dart'as global;
import 'package:hostin/Global Variables/global_Color.dart'as appcolor;
import 'package:hostin/Screens/signInWithOtp.dart';
import 'package:hostin/Widgets/signInButtonAll.dart';
class login_Page_All extends StatefulWidget {
  @override
  _login_Page_AllState createState() => _login_Page_AllState();
}
class _login_Page_AllState extends State<login_Page_All> {
  String buttonon='none';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: global.height,
        width: global.width,
        color: appcolor.backgroundColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            NeumorphicText(
            "Sign In",
            style: NeumorphicStyle(
              depth: 20,
              shape: NeumorphicShape.convex,
              intensity: 12,
              color: Colors.black,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: global.height*.05,
              fontWeight: FontWeight.bold,
            ),
            ),
              SizedBox(height: global.height*.10,),
              InkWell(
                onTap: (){
                  setState(() {
                    if(buttonon!='1'){
                      buttonon='1';
                    }
                  });
                },
                  child:signInButtonAll("Sign In with OTP",Color(0xff75B73B),'assests/Images/otp.png',buttonon=='none'? -12:buttonon=='1'?12:-12)
              ),
              SizedBox(height: global.height*.03,),
              InkWell(
                  onTap: (){
                    setState(() {
                      if(buttonon!='2'){
                        buttonon='2';
                      }
                    });
                  },
                  child:signInButtonAll("Sign In with FaceBook",Color(0xff3A559F),'assests/Images/fb.png',buttonon=='none'? -12:buttonon=='2'?12:-12)
              ),
              SizedBox(height: global.height*.03,),
              InkWell(
                  onTap: (){
                    setState(() {
                      if(buttonon!='3'){
                        buttonon='3';
                      }
                    });
                    print('Facebook SignIn');
                  },
                  child:signInButtonAll("Sign In with Apple",Color(0xff000000),'assests/Images/apple.png',buttonon=='none'? -12:buttonon=='3'?12:-12)
              ),
            SizedBox(
              height: global.height*.10,
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
              Padding(
                padding: EdgeInsets.only(right: 50),
                  child:Neumorphic(
                padding: EdgeInsets.all(4),
                style: NeumorphicStyle(
                  depth: buttonon=='none'?-12:buttonon=='2'?-12:buttonon=='3'?-12:12,
                  intensity: 12,
                  shape: NeumorphicShape.convex,
                  color: appcolor.buttonColor,
                  boxShape: NeumorphicBoxShape.circle(),
                ),
              child:NeumorphicFloatingActionButton(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                  shape: NeumorphicShape.convex,
                  depth: 12,
                  color: appcolor.buttonColor,
                  border: NeumorphicBorder(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                    child: Icon(Icons.arrow_forward,color: Colors.white,size: 30,),
                    onPressed: (){
                      if(buttonon=='1'){
                        Get.to(signInWithOtp());
                      }
                      else{
                        null;
                      }
                    }
                ),
              ),
              ),
                  ]
              ),
            ],
          ),
      ),
    );
  }
}

