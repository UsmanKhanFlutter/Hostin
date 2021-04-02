import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hostin/Global Variables/global_Data.dart'as global;
import 'package:hostin/Global Variables/global_Color.dart'as appcolor;
import 'package:hostin/Screens/selectGender.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class verifyNumber extends StatefulWidget {
  String phone;
  verifyNumber({this.phone});
  @override
  _verifyNumberState createState() => _verifyNumberState();
}
class _verifyNumberState extends State<verifyNumber> {
  var user;
  String _verificationCode;
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          setState(() {
            this.user=credential.providerId;
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
          print("Code Sent");
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
  double depth=12;
  String smssent;
    @override
  Widget build(BuildContext context) {
    return Material(
      child:Container(
        height: global.height,
        width: global.width,
        color: appcolor.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeumorphicText(
              "Verify Your Number",
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
            SizedBox(height: global.height*.03,),
            Container(
              height: global.height*.07,
              width: global.width*.80,
              color: Color(0xffF2F2F0),
              child: PinCodeTextField(
                backgroundColor: Color(0xffF2F2F0),
                keyboardType: TextInputType.number,
                appContext: context,
                pastedTextStyle: TextStyle(
                  backgroundColor: Color(0xffF2F2F0),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                length: 6,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  selectedColor: appcolor.buttonColor,
                  selectedFillColor: appcolor.backgroundColor,
                  activeFillColor: appcolor.backgroundColor,
                  inactiveFillColor: appcolor.backgroundColor,
                  activeColor: appcolor.buttonColor,
                  inactiveColor: appcolor.buttonColor,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 40,
                  fieldWidth: 40,
                  // activeFillColor:
                ),
                cursorColor: Colors.black,
                animationDuration: Duration(milliseconds: 300),
                textStyle: TextStyle(fontSize: 20, height: 1.6),
                enableActiveFill: true,
                boxShadows: [
                  BoxShadow(
                    offset: Offset(2, 2,),
                    blurRadius: 3,
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    smssent = value;
                  });
                },
              ),
            ),
            SizedBox(height: global.height*.03,),
            NeumorphicText(
              "Enter Your Verification Code",
              style: NeumorphicStyle(
                depth: 12,
                shape: NeumorphicShape.convex,
                intensity: 12,
                color: Colors.black,
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: global.height*.018,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: global.height*.03,),
            InkWell(
              onTap: ()async{
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                      verificationId: _verificationCode, smsCode: smssent))
                      .then((user) async {
                        String UID=user.user.uid;
                        GetStorage().write('Uid', UID);
                        GetStorage().write('UserLogin', 'user');
                    if (user.user != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => selectGender()),
                              (route) => false);
                    }
                  });
                } catch (e) {
                  print(e);
                }
                setState(() {
                  this.depth=-12;
                });
                print('Verify Pressed');

              },
              child: Container(
                height: global.height*.06,
                width: global.width*.80,
                child: Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    intensity: 12,
                    color: Color(0xffFFC452),
                    depth: depth,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
                  ),
                  child: Center(child: Text('Verify',style: TextStyle(fontSize: global.height*.03,color: Colors.black,fontWeight: FontWeight.bold),),
                ),
                ),
              ),
            ),
            SizedBox(
              height: global.height*.03,
            ),
            NeumorphicText(
              "Resend Code in 7 Second",
              style: NeumorphicStyle(
                depth: 12,
                shape: NeumorphicShape.convex,
                intensity: 12,
                color: Colors.black,
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: global.height*.015,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


