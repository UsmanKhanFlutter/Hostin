import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hostin/Global Variables/global_Data.dart'as global;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hostin/Screens/selectWardenStudent.dart';
class selectGender extends StatefulWidget {
  @override
  _selectGenderState createState() => _selectGenderState();
}
class _selectGenderState extends State<selectGender> {
  String backgroundColor='none';
  String Gender;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: global.width,
        height: global.height,
        color: Color(0xffF2F2F0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeumorphicText(
              "Select Your Gender",
              style: NeumorphicStyle(
                depth: 12,
                shape: NeumorphicShape.convex,
                intensity: 12,
                color: Colors.black,
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: global.height*.060,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: global.height*.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(backgroundColor!='1'){
                            backgroundColor='1';
                            Gender='Male';
                          }
                        });
                      },
                      child:Neumorphic(
                        style: NeumorphicStyle(
                          color: Color(0xffF2F2F0),
                          shape: NeumorphicShape.convex,
                          shadowLightColor: Colors.grey,
                          shadowDarkColor: Colors.grey,
                          depth: backgroundColor=='none'?12:backgroundColor=='1'?-12:12,
                          intensity: 12,
                          boxShape: NeumorphicBoxShape.circle(),
                        ),
                        child: CircleAvatar(
                            backgroundColor: backgroundColor=='none'? Color(0xffF2F2F0):backgroundColor=='1'?Color(0xffFFC452):Color(0xffF2F2F0),
                          radius: 45,
                          child: Image(
                            image: AssetImage('assests/Images/male3.png'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: global.height*.03,
                    ),
                    NeumorphicText(
                      "Male",
                      style: NeumorphicStyle(
                        depth: 12,
                        shape: NeumorphicShape.convex,
                        intensity: 1,
                        color: Colors.black,
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontSize: global.height*.030,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: global.width*.10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(backgroundColor!='2'){
                            backgroundColor='2';
                            Gender='Female';
                          }
                        });
                      },
                      child:Neumorphic(
                        style: NeumorphicStyle(
                          color: Color(0xffF2F2F0),
                          shape: NeumorphicShape.convex,
                          shadowLightColor: Colors.grey,
                          shadowDarkColor: Colors.grey,
                          depth: backgroundColor=='none'?12:backgroundColor=='2'?-12:12,
                          intensity: 1,
                          boxShape: NeumorphicBoxShape.circle(),
                        ),
                        child: CircleAvatar(
                          backgroundColor: backgroundColor=='none'? Color(0xffF2F2F0):backgroundColor=='2'?Color(0xffFFC452):Color(0xffF2F2F0),
                          radius: 45,
                          child: Image(
                            image: AssetImage('assests/Images/female1.png'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: global.height*.03,
                    ),
                    NeumorphicText(
                      "Female",
                      style: NeumorphicStyle(
                        depth: 12,
                        shape: NeumorphicShape.convex,
                        intensity: 12,
                        color: Colors.black,
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontSize: global.height*.030,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: global.height*.05,
            ),
            InkWell(
              onTap: (){
                print('Select Gender Pressed');
                print(Gender);
                GetStorage().write('Gender', Gender);
                Get.to(selectWardenStudent(),);
              },
              child: Container(
                height: global.height*.06,
                width: global.width*.80,
                child: Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    intensity: 12,
                    color: Color(0xffFFC452),
                    depth: backgroundColor=='none'||backgroundColor=='1'?12:-12,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
                  ),
                  child: Center(child: Text('Next',style: TextStyle(fontSize: global.height*.030,color: Colors.black,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
