import 'dart:developer';
import 'dart:io';

import 'package:aip_poc/config/app_color_constants.dart';
import 'package:aip_poc/screens/authentication/login.dart';
import 'package:aip_poc/screens/home.dart';
import 'package:aip_poc/screens/utils/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // _splashScreenOff();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColorConstants.primaryColor,
    ));

    // Device Rotation Is Turn Off
    if (Platform.isAndroid) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }
    return const Scaffold(
      body: SafeArea(
        child: Home(),
      ),
    );
  }

  // Splash Screen Off After 2 seconds
  _splashScreenOff() {
    // Future.delayed(const Duration(seconds: 1), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (BuildContext context) => const Login(),
    //     ),
    //   );
    // });
  }
}
