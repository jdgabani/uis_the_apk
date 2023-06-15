import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_the_apk/Controller/variable.dart';
import 'package:uis_the_apk/Screens/AuthScreen/login_screen.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/common_textformfield.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/elevated_button.dart';


class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 25.sp),
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          'New Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
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
              "Set your new password",
              style: TextStyle(
                color: const Color(0xff686868),
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            CommonTextFormField(
              controller: Controller.newPassword,
              validator: (value) {
                return null;
              },
              hintText: "Enter your password",
              obscureText: false,
            ),
            SizedBox(height: 19.h,),
            CommonTextFormField(
              controller: Controller.confirmNewPassword,
              validator: (value) {
                return null;
              },
              hintText: "Enter your confirm password",
              obscureText: false,
            ),
            SizedBox(height: 103.h),
            Center(
              child: CommonElevatedButton(
                  onPressed: () {
                    Get.to(const LoginScreen());
                  },
                  text: "Set Password"),
            ),
          ],
        ),
      ),
    );
  }
}
