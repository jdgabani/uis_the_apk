import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_the_apk/Api/Model/Response_Model/sign_up_response_model.dart';
import 'package:uis_the_apk/Api/View_model/sign_up_viewmodel.dart';
import 'package:uis_the_apk/Api/api_response.dart';
import 'package:uis_the_apk/Bottom_Bar/bottombar_screen.dart';
import 'package:uis_the_apk/Constants/colors.dart';
import 'package:uis_the_apk/Constants/image_path.dart';
import 'package:uis_the_apk/Constants/text_style.dart';
import 'package:uis_the_apk/Controller/selector_controller.dart';
import 'package:uis_the_apk/Screens/AuthScreen/login_screen.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/common_textformfield.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/elevated_button.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final formKey = GlobalKey<FormState>();

  SignUpViewModel signUpViewModel = Get.put(SignUpViewModel());
  SelectorController selectorController = Get.put(SelectorController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectorController>(
        builder: (controller){
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 97.h,
                        ),
                        Image.asset(
                          ImagePath.logoImage,
                          height: 158.h,
                          width: 302.w,
                        ),
                        SizedBox(height: 34.h),
                        Text(
                          'Sign up',
                          style: textSignup,
                        ),
                        SizedBox(height: 34.h),
                        CommonTextFormField(
                            validator: (value) {
                              if(value!.trim().isEmpty){
                                return 'This field is required';
                              }
                              return null;
                            },
                            controller: signUpViewModel.nameSignUp,
                            hintText: "Enter your name",
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            obscureText: false),
                        SizedBox(
                          height: 19.h,
                        ),
                        CommonTextFormField(
                            validator: (value) {
                              RegExp regex1 = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
                              );
                              if (value!.trim().isEmpty){
                                return 'This field is required';
                              } else if (!regex1.hasMatch(value)){
                                return 'Please enter valid Email';
                              }
                              return null;
                            },
                            controller: signUpViewModel.emailSignUp,
                            hintText: "Enter your email",
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            obscureText: false),
                        SizedBox(
                          height: 19.h,
                        ),
                        CommonTextFormField(
                            suffixIcon: GestureDetector(
                              child: controller.obs == false
                                  ? const Icon(
                                Icons.visibility,
                                size: 20.00,
                              )
                                  : const Icon(
                                Icons.visibility_off,
                                size: 20.00,
                              ),
                              onTap: () {
                                controller.isObscure();
                              },
                            ),
                            validator: (password) {
                              RegExp regex = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                              if (password!.isEmpty) {
                                return 'This field is required';
                              } else if (!regex.hasMatch(password)) {
                                return 'Your password must be at least 8 characters long\n contain at least one number and have a mixture\n of uppercase and lowercase letters.';
                              }
                              return null;
                            },
                            controller: signUpViewModel.passwordSignUp,
                            hintText: "Enter your password",
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            obscureText: controller.obs),
                        SizedBox(
                          height: 19.h,
                        ),
                        CommonTextFormField(
                            suffixIcon: GestureDetector(
                              child: controller.obss == false
                                  ? const Icon(
                                Icons.visibility,
                                size: 20.00,
                              )
                                  : const Icon(
                                Icons.visibility_off,
                                size: 20.00,
                              ),
                              onTap: () {
                                controller.isObscures();
                              },
                            ),
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'This field is required';
                              } else if (value!=signUpViewModel.passwordSignUp.text) {
                                return 'Confirm Password not match';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            controller: signUpViewModel.confirmPasswordSignUp,
                            hintText: "Enter your confirm password",
                            obscureText: controller.obss),
                        SizedBox(height: 50.h),

                        GetBuilder<SignUpViewModel>(
                            builder: (controller){
                              if(controller.apiResponse.status == Status.INITIAL||
                                  controller.apiResponse.status == Status.COMPLETE ||
                                  controller.apiResponse.status == Status.ERROR){
                                return CommonElevatedButton(
                                  onPressed: () async {
                                    await controller.signUpViewModel({
                                      "name" : signUpViewModel.nameSignUp.text,
                                      "email" : signUpViewModel.emailSignUp.text,
                                      "password" : signUpViewModel.passwordSignUp.text,
                                      "cpassword" : signUpViewModel.confirmPasswordSignUp.text,
                                    });

                                    if (controller.apiResponse.status==Status.COMPLETE){
                                      SignUpResponseModel data = controller.apiResponse.data;

                                      if (data.status == "success"){
                                        if (data.data.status == "pending"){
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('${data.message}'))
                                          );
                                          buildGeneralDialog();
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('${data.message}'))
                                          );

                                          ///get storage add userid
                                          ///navigate to home
                                        }

                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text(data.message))
                                        );
                                      }else{
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                                content: Text('${data.message}'))
                                        );
                                      }
                                    }
                                    if (formKey.currentState!.validate()) ;
                                  },
                                  text: 'Sign Up',

                                );
                              } else {
                                return const SpinKitFadingCircle(
                                  color: PickColor.secondaryColor,
                                  size: 30.0,
                                );
                              }
                            }
                        ),
                        SizedBox(height: 34.h),
                        RichText(
                          text: TextSpan(
                            text: "Already have an account?",
                            style: haveAccount,
                            children: [
                              TextSpan(
                                  text: " Login Now",
                                  style: loginNow,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(
                                        const LoginScreen(),
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
            ),
          );
        });
  }
}

Future<dynamic> buildGeneralDialog() {
  return Get.generalDialog(
    pageBuilder: (context, animation, secondaryAnimation) {
      return Dialog(
        child: Container(
          width: 332.w,
          height: 407.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 276.w, right: 18.w, top: 21.h, bottom: 63.h),
                child: CloseButton(
                  onPressed: () {
                    Get.close;
                  },
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                "Please wait until\n"
                    "admin approve\n"
                    "your profile ",
                style: TextStyle(fontSize: 26.sp,fontWeight: FontWeight.w400,),
              ),
              SizedBox(height: 83.h),
              CommonElevatedSmallButton(
                onPressed: () {
                  Get.to(() => const BottomBarScreen());
                },
                text: "OK",
              ),
            ],
          ),
        ),
      );
    },
    );
  }
