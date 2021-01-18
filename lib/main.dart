import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nowmov/nowplaying/mainowplaying.dart';
import 'package:nowmov/style/maincss.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: second.withOpacity(0.5),
      // navigation bar color
      statusBarColor: second.withOpacity(0.5), // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'm', backgroundColor: second),
      home: MainNowPlaying(),
    );
  }
}

// class Bawah extends StatefulWidget {
//   @override
//   _BawahState createState() => _BawahState();
// }

// class _BawahState extends State<Bawah> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(),
//         ],
//       ),
//     );
//   }
// }
