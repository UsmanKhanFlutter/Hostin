import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hostin/Screens/splashScreen.dart';
import 'package:hostin/Global Variables/global_Color.dart'as appcolor;
// import 'package:device_preview/device_preview.dart';


// void main() => runApp(
//   DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => MyApp(), // Wrap your app
//   ),
// );
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       locale: DevicePreview.locale(context), // Add the locale here
//       builder: DevicePreview.appBuilder, // Add the builder here
//       home: splashScreen(),
//     );
//   }
// }




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        backgroundColor: appcolor.backgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}

