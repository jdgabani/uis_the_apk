import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uis_the_apk/Bottom_Bar/Home/form_screen1.dart';
import 'package:uis_the_apk/Bottom_Bar/Home/form_screen2.dart';
import 'package:uis_the_apk/Bottom_Bar/Home/form_screen3.dart';
import 'package:uis_the_apk/Controller/variable.dart';

class FormIndicator extends StatefulWidget {
  const FormIndicator({Key? key}) : super(key: key);

  @override
  State<FormIndicator> createState() => _FormIndicatorState();
}

class _FormIndicatorState extends State<FormIndicator> {
  List formPage = [
    const FormScreen1(),
    const FormScreen2(),
    const FormScreen3(),
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 55.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    CupertinoIcons.back,
                  ),
                ),
                Text(
                  "Form",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                ),
                selected == 2
                    ? Image.asset(
                        'assets/image/preview.png',
                        height: 37.h,
                        width: 37.w,
                      )
                    : SizedBox(
                        height: 37.h,
                        width: 37.w,
                      ),
              ],
            ),
          ),
          SizedBox(
            height: 24.5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) => Container(
                  height: 2.h,
                  width: 123.w,
                  color: selected >= index
                      ? const Color(0xff00529B)
                      : const Color(0xffDBDBDB),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              controller: Controller.controllerPage,
              onPageChanged: (value) {
                setState(() {
                  selected = value;
                });
              },
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: formPage[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
