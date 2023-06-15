import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uis_the_apk/Bottom_Bar/Home/form_indicator.dart';
import 'package:uis_the_apk/Constants/image_path.dart';


class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: drawerKey,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          ImagePath.logoImage,
          height: 34.h,
          width: 65.w,
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            drawerKey.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    const FormIndicator(),
                  );
                },
                child: Center(
                  child: Image.asset(
                    'assets/image/qr.png',
                    height: 291.67.h,
                    width: 291.67.h,
                  ),
                ),
              ),
              SizedBox(
                height: 31.h,
              ),
              const Text(
                "Notice",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 53.h,
                width: 388.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(0, 2),
                      blurRadius: 7,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6.r)
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 15),
                  child: Text('Lorem Ipsum is simply dummy text of the ',
                  style: TextStyle(
                    color:const Color(0xff959595),
                    fontSize:14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
                ),
              ),
              SizedBox(height: 13.h),
              Container(
                height: 53.h,
                width: 388.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6.r)
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 15),
                  child: Text('Lorem Ipsum is simply dummy text of the ',
                    style: TextStyle(
                      color:const Color(0xff959595),
                      fontSize:14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
