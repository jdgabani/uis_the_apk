import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_the_apk/Constants/colors.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
          'Notification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 53.h,
                  width: 388.w,
                  margin:
                  EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 0,
                        blurRadius: 16.sp,
                        offset: const Offset(4, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                   color: PickColor.secondaryColor,
                                   borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: const Icon(Icons.notifications_none_outlined,color: Colors.white70,),
                                ),
                                const SizedBox(width: 9),
                                Text(
                                  "Lorem Ipsum is simply dummy text of the ext \nof theext of the ",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xff959595),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text("2min",style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xff959595),
                        ),),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
