import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hostin/Global Variables/global_Data.dart'as global;
import 'package:hostin/Global Variables/global_Color.dart'as appcolor;
signInButtonAll(String text, Color color, String url,double depth, )=> Container(
  width: global.width*.80,
  height: global.height*.07,
  child: Neumorphic(
    duration: Duration(
      milliseconds: 500,
    ),
    style: NeumorphicStyle(
      shape: NeumorphicShape.flat,
      intensity: 12,
      shadowDarkColorEmboss: Colors.grey,
      shadowLightColorEmboss: Colors.grey,
      shadowLightColor: Colors.grey,
      shadowDarkColor: Colors.grey,
      color: Color(0xffF2F2F0),
      depth: depth,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
    ),
    child: Row(
      children: [
        Padding(padding: EdgeInsets.only(left: 25),),
        CircleAvatar(
          child: Image(image: AssetImage(url),),
          backgroundColor: Color(0xffF2F2F0),
          radius: 17,
        ),
        Padding(padding: EdgeInsets.only(left: 30),),
        Text(text,style: TextStyle(color: color,fontSize: global.height*.020,fontWeight: FontWeight.bold))
      ],
    ),
  ),
);