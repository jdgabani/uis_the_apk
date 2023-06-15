import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_the_apk/Constants/colors.dart';
import 'package:uis_the_apk/Controller/variable.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/common_textformfield.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/elevated_button.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          child:
          Icon(Icons.arrow_back_ios, color: Colors.black, size: 20.sp),
          onTap: () {
          },
        ),
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Divider(
                color: Color(0xffF0F0F0),
                thickness: 1,
              ),
              SizedBox(
                height: 24.5.h,
              ),
              Stack(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.bottomRight,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 104.h,
                      width: 104.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/image/profile.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0.h,
                    bottom: 0.h,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 34.h,
                        width: 34.h,
                        decoration: const BoxDecoration(
                          color: PickColor.secondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit, color: Colors.white, size: 18.sp,),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 53.h,
              ),
              CommonTextFormField(
                  controller: Controller.nameProfile,
                  validator: (value) {
                    return null;
                  },
                  hintText: "Enter youe name",
                  obscureText: false),
              SizedBox(height: 19.h,),
              CommonTextFormField(controller: Controller.emailProfile,
                  validator: (value) {
                    return null;
                  },
                  hintText: "Enter your email",
                  obscureText: false),
              SizedBox(height: 19.h,),
              CommonTextFormField(controller: Controller.phoneNumberProfile,
                  validator: (value) {
                    return null;
                  },
                  hintText: "Enter your Phone Number",
                  obscureText: false),
              SizedBox(height: 19.h,),
              CommonTextFormField(controller: Controller.locationProfile,
                  validator: (value) {
                    return null;

                  },
                  hintText: "Enter your Location",
                  obscureText: false),
              SizedBox(
                height: 117.h,
              ),
              CommonElevatedButton(onPressed: () {}, text: "Save"),
            ],
          ),
        ),
      ),
    );
  }
}
