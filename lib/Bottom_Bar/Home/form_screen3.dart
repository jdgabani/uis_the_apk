import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:uis_the_apk/Constants/color.dart';
import 'package:uis_the_apk/Controller/form.dart';
import 'package:uis_the_apk/Controller/variable.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/common_textformfield.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/elevated_button.dart';


class FormScreen3 extends StatefulWidget {
  const FormScreen3({Key? key}) : super(key: key);

  @override
  State<FormScreen3> createState() => _FormScreen3State();
}

class _FormScreen3State extends State<FormScreen3> {
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();
  DateFormat format = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 21.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.4.w),
              child: Text(
                'Name of person entitled to receive the cremated \nremalns',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            CommonTextFormField(
                controller: Controller.printedReceiveForm3,
                validator: (value) {
                  return null;
                },
                hintText: "Printed",
                obscureText: false),
            SizedBox(height: 14.h),
            CommonTextFormField(
                controller: Controller.relationshipReceiveForm3,
                validator: (value) {
                  return null;
                },
                hintText: "Relationship",
                obscureText: false),
            SizedBox(height: 14.h),
            CommonTextFormField(
              controller: Controller.signatureReceiveForm3,
              validator: (value) {
                return null;
              },
              hintText: "Signature",
              obscureText: false,
            ),
            SizedBox(height: 14.h),
            CommonTextFormField(
                controller: Controller.dateTimeReceiveForm3,
                validator: (value) {
                  return null;
                },
                hintText: "Date/Time",
                suffixIcon: IconButton(
                  onPressed: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      currentDate: DateTime.now(),
                    ).then((value) {
                      Controller.dateTimeReceiveForm3.text =
                          format.format(value!).toString();
                      setState(() {});
                    });
                    setState(() {});
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
                obscureText: false),
            SizedBox(
              height: 57.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.4.w),
              child: Text(
                'Name of person releasing cremated remains',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            CommonTextFormField(
                controller: Controller.printedReleasingForm3,
                validator: (value) {
                  return null;
                },
                hintText: "Printed",
                obscureText: false),
            SizedBox(
              height: 14.h,
            ),
            CommonTextFormField(
                controller: Controller.signatureReleasingForm3,
                validator: (value) {
                  return null;
                },
                hintText: "Signature",
                obscureText: false),
            SizedBox(
              height: 14.h,
            ),
            CommonTextFormField(
                controller: Controller.dateTimeReleasingForm3,
                validator: (value) {
                  return null;
                },
                hintText: "Date/Time",
                suffixIcon: IconButton(
                  onPressed: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      currentDate: DateTime.now(),
                    ).then((value) {
                      Controller.dateTimeReleasingForm3.text =
                          format.format(value!).toString();
                      setState(() {});
                    });
                    setState(() {});
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
                obscureText: false),
            SizedBox(
              height: 31.h,
            ),
            Text(
              'Upload Photo',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Container(
              height: 56.h,
              width: 388.w,
              decoration: BoxDecoration(
                color: const Color(0xffF7F7F7),
                border: Border.all(
                  color: const Color(0xffE0E0E0),
                ),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    SizedBox(
                      width: 12.w,
                    ),
                    Container(
                      height: 31.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        color: AppColor.lightGrey,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Center(
                        child: Text(
                          "Choose file",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: const Color(0xff848484),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 31.h,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  barrierColor: AppColor.lightBlack,
                  context: context,
                  builder: (context) => Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.sp),
                    ),
                    child: SizedBox(
                      height: 356.h,
                      width: 311.w,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 26.h,
                          ),
                          Container(
                            height: 177.h,
                            width: 271.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7.sp),
                              border: Border.all(
                                  color: AppColor.lightGrey, width: 0.3.sp),
                            ),
                            child: SfSignaturePad(
                              key: signaturePadKey,
                              minimumStrokeWidth: 1,
                              maximumStrokeWidth: 3,
                              strokeColor: Colors.blue,
                              backgroundColor: Colors.white70,
                            ),
                          ),
                          SizedBox(
                            height: 27.h,
                          ),
                          CommonElevatedSmallButton(
                            onPressed: () {},
                            text: 'Save',
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              signaturePadKey.currentState!.clear();
                            },
                            child: Container(
                              height: 35.h,
                              width: 79.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.sp),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    offset: const Offset(4, 4),
                                    blurRadius: 20.sp,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Redo",
                                  style: TextStyle(
                                    color: AppColor.blueColor,
                                    fontSize: 12.sp,
                                    fontFamily: 'Poly',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                height: 35.h,
                width: 79.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(4, 4),
                      blurRadius: 20.sp,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Ensign",
                    style: TextStyle(
                      color: AppColor.blueColor,
                      fontSize: 12.sp,
                      fontFamily: 'Poly',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 46.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonElevatedPerviousButton(
                  onPressed: () {
                    NextPage.previous();
                  },
                ),
                SizedBox(
                  width: 24.6.w,
                ),
                CommonElevatedSmallButton(
                  onPressed: () {},
                  text: "Submit",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
