import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hostin/Global Variables/global_Data.dart'as global;
totorialScreenWidget(String url,String heading,String detail)=>Column(
  children: [
    SizedBox(height: global.height*.02,),
    Container(
        height: global.height*.40,
        width: global.width*.75,
        child: Neumorphic(
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
            shape: NeumorphicShape.concave,
            depth: 12,
            intensity: 1,
            color: Color(0xffFFC452),
          ),
          child: Image(
            image: AssetImage(url),
          ),
        )
    ),
    SizedBox(
      height: global.height*.02,
    ),
    Text(heading,
      style: TextStyle(
        fontSize: global.height*.03,
        fontWeight: FontWeight.w900,
      ),
    ),
    SizedBox(
      height: global.height*.01,
    ),
    Text(detail
      ,textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: global.height*.02,
        color: Color(0xffFFC452),
      ),
    )
  ],
);