import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:hostin/Global Variables/global_Data.dart'as global;
import 'package:hostin/Global Variables/global_Color.dart'as appcolor;
import 'package:hostin/Screens/verifyNumber.dart';
class signInWithOtp extends StatefulWidget {
  @override
  _signInWithOtpState createState() => _signInWithOtpState();
}
class _signInWithOtpState extends State<signInWithOtp> {
  double depth=12;
  String phoneNo;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
        height: global.height,
        width: global.width,
        color: appcolor.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children:[
            NeumorphicText(
              "Sign Up with Mobile Number",
              style: NeumorphicStyle(
                depth: 12,
                shape: NeumorphicShape.convex,
                intensity: 12,
                color: Colors.black,
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: global.height*.040,
                fontWeight: FontWeight.bold,
              ),
            ),
          SizedBox(
            height: global.height*.05,
          ),
          Container(
            width: global.width*.80,
            height: global.height*.07,
          child:
            Neumorphic(
            style: NeumorphicStyle(
              boxShape:NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
              shape: NeumorphicShape.convex,
              depth: depth,
              intensity: 12,
              shadowDarkColorEmboss: Colors.grey,
              shadowLightColorEmboss: Colors.grey,
              shadowLightColor: Colors.grey,
              shadowDarkColor: Colors.grey,
              color: Color(0xffF2F2F0),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: global.width*.13),
            child:TextField(
              onChanged: (value){
                  this.phoneNo = '+92$value';
              },
              style: TextStyle(
                fontSize: global.height*.030,
              ),
              keyboardType: TextInputType.number,
              onTap: (){
                setState(() {
                  depth=-12;
                });
              },
              decoration: InputDecoration(
                hintText: '3369080966',
                border: InputBorder.none,
                icon: Text('+92 | ',style: TextStyle(fontSize: global.height*.030,),),
              ),
            ),
          )
          ),
          ),
            SizedBox(
              height: global.height*.20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  Padding(
                    padding: EdgeInsets.only(right: 50),
                    child:Neumorphic(
                      padding: EdgeInsets.all(4),
                      style: NeumorphicStyle(
                        depth: depth==12?-12:12,
                        intensity: 12,
                        shape: NeumorphicShape.convex,
                        color: appcolor.buttonColor,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      child:NeumorphicFloatingActionButton(
                          style: NeumorphicStyle(
                            boxShape: NeumorphicBoxShape.circle(),
                            shape: NeumorphicShape.convex,
                            depth: depth==12?-12:12,
                            color: appcolor.buttonColor,
                            border: NeumorphicBorder(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          child: Icon(Icons.arrow_forward,color: Colors.white,size: global.height*.04,),
                          onPressed: (){
                           Get.to(verifyNumber(phone:phoneNo));
                          }
                      ),
                    ),
                  ),
                ]
            ),
    ],
        ),
    )
    );
  }
}
