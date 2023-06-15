import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_the_apk/Constants/color.dart';
import 'package:uis_the_apk/Constants/colors.dart';
import 'package:uis_the_apk/Constants/text_style.dart';
import 'package:uis_the_apk/Screens/AuthScreen/new_password_screen.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/elevated_button.dart';



class OtpNumberScreen extends StatefulWidget {
  const OtpNumberScreen({Key? key}) : super(key: key);

  @override
  State<OtpNumberScreen> createState() => _OtpNumberScreenState();
}

class _OtpNumberScreenState extends State<OtpNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Verifying Number',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            const Text(
              "We sent an otp to your mobile number\n5269874152",
              style: TextStyle(color: Color(0xff686868)),
            ),
            SizedBox(height: 27.h),
            Center(
              child: Pinput(
                length: 6,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  width: 56.w,
                  height: 76.h,
                  decoration: BoxDecoration(
                    color: AppColor.otp,
                    borderRadius: BorderRadius.circular(6.r),
                    border:
                    Border.all(color: PickColor.secondaryColor),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Center(child: RichText(
              text: TextSpan(
                text: "Not yet get?",
                style: notYetAccount,
                children: [
                  TextSpan(
                      text: " Resend OTP",
                      style: resendNow,
                      recognizer: TapGestureRecognizer()..onTap=(){
                      }
                  ),
                ],),
            ),),
            SizedBox(height: 98.h),
            Center(
              child: CommonElevatedButton(onPressed: () {
                Get.to(const NewPasswordScreen(),);
              }, text: "Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
