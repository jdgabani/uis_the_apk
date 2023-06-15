import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_the_apk/Controller/variable.dart';
import 'package:uis_the_apk/Screens/AuthScreen/otp_number_screen.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/common_textformfield.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/elevated_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 25.sp),
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          'Forgot Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Enter your email or phone number & \nwill send you instruction on hoe to reset \nit.",
              style: TextStyle(
                color: const Color(0xff686868),
              fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Text(
              "Email",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: const Color(0xff313131),
              ),
            ),
            SizedBox(height: 12.h),
            CommonTextFormField(
                controller: Controller.emailForgotPassword,
                validator: (value) {
                  return null;
                },
                hintText: "Enter your email",
                obscureText: false),
            SizedBox(height: 28.h),
            Center(
                child: Text(
              "or",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: const Color(0xff676767)),
            )),
            SizedBox(height: 28.h),
            Text(
              "Mobile Number",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: const Color(0xff313131),
              ),
            ),
            SizedBox(height: 12.h),
            CommonTextFormField(
              controller: Controller.mobileNumberForgotPassword,
              validator: (value) {
                return null;
              },
              hintText: "Enter your Mobile no.",
              obscureText: false,
            ),
            SizedBox(height: 91.h),
            Center(
              child: CommonElevatedButton(onPressed: () {
                Get.to(const OtpNumberScreen(),);
              }, text: "Sent"),
            ),
          ],
        ),
      ),
    );
  }
}
