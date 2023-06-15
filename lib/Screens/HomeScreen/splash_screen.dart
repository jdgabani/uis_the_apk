import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uis_the_apk/Constants/image_path.dart';
import 'package:uis_the_apk/Screens/AuthScreen/login_screen.dart';
import 'package:uis_the_apk/Screens/AuthScreen/signup_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Get.to(const SignupScreen());
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImagePath.logoImage,
          width: 341.w,
          height: 178.h,
        ),
      ),
    );
  }
}
