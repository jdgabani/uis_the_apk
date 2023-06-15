import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_the_apk/Api/Model/Response_Model/log_in_response_model.dart';
import 'package:uis_the_apk/Api/View_model/log_in_viewmodel.dart';
import 'package:uis_the_apk/Api/api_response.dart';
import 'package:uis_the_apk/Bottom_Bar/bottombar_screen.dart';
import 'package:uis_the_apk/Constants/colors.dart';
import 'package:uis_the_apk/Constants/image_path.dart';
import 'package:uis_the_apk/Constants/text_style.dart';
import 'package:uis_the_apk/Controller/getx_controller.dart';
import 'package:uis_the_apk/Controller/selector_controller.dart';
import 'package:uis_the_apk/Screens/AuthScreen/forgot_password.dart';
import 'package:uis_the_apk/Screens/AuthScreen/signup_screen.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/common_textformfield.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/elevated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GetController demo = Get.put(
    GetController(),
  );

  final formKey = GlobalKey<FormState>();

  LogInViewModel logInViewModel = Get.put(LogInViewModel());
  SelectorController selectorController = Get.put(SelectorController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectorController>(builder: (controller) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 118.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      ImagePath.logoImage,
                      height: 158.h,
                      width: 302.w,
                    ),
                  ),
                  SizedBox(height: 56.h),
                  Text(
                    'Login',
                    style: loginStyle,
                  ),
                  SizedBox(height: 7.h),
                  Text(
                    'Welcome back!',
                    style: welcomeBack,
                  ),
                  SizedBox(height: 19.h),
                  CommonTextFormField(
                    controller: logInViewModel.emailLogin,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      RegExp regex1 = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                      );
                      if (value!.trim().isEmpty) {
                        return 'This field is required';
                      } else if (!regex1.hasMatch(value)) {
                        return 'please enter valid Email';
                      }
                      return null;
                    },
                    hintText: 'Enter your email',
                  ),
                  SizedBox(height: 19.h),
                  CommonTextFormField(
                    hintText: 'Enter your password',
                    controller: logInViewModel.passwordLogin,
                    obscureText: controller.obs,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    suffixIcon: GestureDetector(
                      child: Icon(
                        controller.obs == false
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onTap: () {
                        controller.isObscure();
                      },
                    ),
                    validator: (password) {
                      RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#&*~]).{8,}$',
                      );
                      if (password!.isEmpty) {
                        return 'This field is required';
                      } else if (!regex.hasMatch(password)) {
                        return 'Your password must be at least 8 characters long\n'
                            'contain at least one number and have a mixture\n '
                            'of uppercase and lowercase letters.';
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                        onPressed: () {
                          Get.to(const ForgotPassword());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: forgetPassword,
                        )),
                  ),
                  SizedBox(height: 36.h),
                  GetBuilder<LogInViewModel>(builder: (controller) {
                    if (controller.apiResponseLogin.status == Status.INITIAL ||
                        controller.apiResponseLogin.status == Status.COMPLETE ||
                        controller.apiResponseLogin.status == Status.ERROR) {
                      return CommonElevatedButton(
                          onPressed: () async {
                            await controller.logInViewModel({
                              "email": logInViewModel.emailLogin.text,
                              "password": logInViewModel.passwordLogin.text,
                            });
                            if (controller.apiResponseLogin.status ==
                                Status.COMPLETE) {
                              LogInResponseModel data =
                                  controller.apiResponseLogin.data;

                              if (data.status == "success") {
                                if (data.data == "pending") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('${data.message}')));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('${data.message}')));
                                  Get.to(BottomBarScreen());
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(data.message)));
                              } else {
                                print('error');
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('${data.message}')));
                              }
                            }
                            if (formKey.currentState!.validate()) ;
                          },
                          text: "Login");
                    } else {
                      return const SpinKitFadingCircle(
                        color: PickColor.secondaryColor,
                        size: 30.0,
                      );
                    }
                  }),
                  SizedBox(height: 36.h),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account?",
                      style: haveAccount,
                      children: [
                        TextSpan(
                            text: " Register Now",
                            style: registerNow,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(
                                  const SignupScreen(),
                                );
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
