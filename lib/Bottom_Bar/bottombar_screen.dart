import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:uis_the_apk/Bottom_Bar/Home/scan_page.dart';
import 'package:uis_the_apk/Bottom_Bar/history.dart';
import 'package:uis_the_apk/Bottom_Bar/notifications_screen.dart';
import 'package:uis_the_apk/Bottom_Bar/profile_screen.dart';
import 'package:uis_the_apk/Constants/color.dart';
import 'package:uis_the_apk/Controller/getx_controller.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selected = 0;
  List pageName = [
    const ScanPage(),
    const NotificationsScreen(),
    const History(),
    const ProfileScreen(),
  ];
  GetController demo = Get.put(
    GetController(),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetController>(
      builder: (controller) {
        return Scaffold(
          body: pageName[selected],
          bottomNavigationBar: Container(
            height: 75.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(-13, 0),
                    blurRadius: 13.sp,
                    spreadRadius: 1),
              ],
            ),
            child: SalomonBottomBar(
              margin: EdgeInsets.symmetric(
                horizontal: 39.w,
              ),
              itemPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              selectedItemColor: AppColor.blueColor,
              unselectedItemColor: const Color(0xffD9BB97),
              currentIndex: selected,
              onTap: (value) {
                selected = value;
                controller.update();
              },
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon:Icon(Icons.home_outlined,size:30.sp,),
                  title: Text(
                    "Home",
                    style: TextStyle(
                      fontFamily: 'Poly',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: const Icon(Icons.notifications_none),
                  title: Text(
                    "Notification",
                    style: TextStyle(
                      fontFamily: 'Poly',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: const Icon(Icons.history),
                  title: Text(
                    "history",
                    style: TextStyle(
                      fontFamily: 'Poly',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: const Icon(Icons.person),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      fontFamily: 'Poly',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
