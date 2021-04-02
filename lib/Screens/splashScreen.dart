import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hostin/Global Variables/global_Data.dart' as global;
import 'package:hostin/checkNetwork.dart';
import 'package:hostin/Global Variables/global_Color.dart' as appcolor;

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    animation = Tween<double>(begin: 20, end: -20).animate(animationController);
    animation.addListener(() {
      setState(() {});
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
      print('$status');
    });
    animationController.forward();
    Timer(Duration(seconds: 5),
        () => checkNetwork().then((value) => animationController.dispose()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appcolor.backgroundColor,
      height: global.height,
      width: global.width,
      child: Center(
          child: Container(
        height: global.height * .09,
        width: global.width * .40,
        child: Neumorphic(
          style: NeumorphicStyle(
            color: appcolor.backgroundColor,
            shape: NeumorphicShape.concave,
            intensity: 12,
            depth: animation.value,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text.rich(TextSpan(
                text: 'HOST',
                style: TextStyle(fontSize: global.height * .040),
                children: <InlineSpan>[
                  TextSpan(
                    text: 'l',
                    style: TextStyle(
                      color: appcolor.buttonColor,
                      fontSize: global.height * .050,
                    ),
                  ),
                  TextSpan(
                    text: 'N',
                    style: TextStyle(
                      fontSize: global.height * .040,
                    ),
                  ),
                ])),
          ),
        ),
      )),
    );
  }
}
