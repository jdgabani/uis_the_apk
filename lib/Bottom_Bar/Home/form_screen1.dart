import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uis_the_apk/Api/View_model/get_all_forms_view_model.dart';
import 'package:uis_the_apk/Api/api_response.dart';
import 'package:uis_the_apk/Controller/form.dart';
import 'package:uis_the_apk/Controller/variable.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/common_textformfield.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/elevated_button.dart';

class FormScreen1 extends StatefulWidget {
  const FormScreen1({Key? key}) : super(key: key);

  @override
  State<FormScreen1> createState() => _FormScreen1State();
}

class _FormScreen1State extends State<FormScreen1> {

  GetAllFormsViewModel getAllFormsViewModel
  = Get.put(GetAllFormsViewModel());

  DateFormat format = DateFormat('dd/MM/yyyy');
  DateFormat format1 = DateFormat('dd/MM/yyyy hh:mm:ss');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 27.5.h,
            ),
            CommonTextFormField(
              controller: Controller.nameOfTheDeceasedForm1,
              validator: (value) {
                return null;
              },
              hintText: "Name of the Deceased",
              obscureText: false,
            ),
            SizedBox(height: 14.h),
            CommonTextFormField(
              controller: Controller.dateOfDeathForm1,
              validator: (value) {
                return null;
              },
              hintText: "Date of Death",
              suffixIcon: IconButton(
                onPressed: () async {
                  await showDatePicker(context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900) ,
                    lastDate: DateTime.now(),
                    currentDate: DateTime.now(),
                  ).then((value){
                    Controller.dateOfDeathForm1.text=
                        format.format(value!).toString();
                    setState(() {
                    });
                  });
                  setState(() {
                  });
                },
                icon: const Icon(Icons.calendar_today),
              ),

              obscureText: false,
            ),
            SizedBox(height: 14.h),
            CommonTextFormField(
                controller: Controller.placeOfDeathForm1,
                validator: (value) {
                  return null;
                },
                hintText: "Place of Death",
                obscureText: false),
            SizedBox(height: 14.h),
            CommonTextFormField(
                controller: Controller.numberOnTheUISBraceletForm1,
                validator: (value) {
                  return null;
                },
                hintText: "Number on the UIS Bracelet",
                obscureText: false),
            SizedBox(height: 14.h),
            CommonTextFormField(
                controller: Controller.dateTimeAttachedForm1,
                validator: (value) {
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () async {
                    await showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900) ,
                      lastDate: DateTime.now(),
                      currentDate: DateTime.now(),
                    ).then((value){
                      Controller.dateTimeAttachedForm1.text=
                          format1.format(value!).toString();
                      setState(() {
                      });
                    });
                    setState(() {
                    });
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
                hintText: "Date/Time Attached",
                obscureText: false),
            SizedBox(height: 35.h),
            Text(
              'Name of Person Securing tha UIS on tha Deceased\n(Place tha Bracelet on tha ankle of the deceased)',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            CommonTextFormField(
                controller: Controller.printedForm1,
                validator: (value) {
                  return null;
                },
                hintText: "Printed",
                obscureText: false),
            SizedBox(height: 14.h),
            CommonTextFormField(
                controller: Controller.signatureForm1,
                validator: (value) {
                  return null;
                },
                hintText: "Signature",
                obscureText: false),
            SizedBox(
              height: 84.h,
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CommonElevatedSmallButton(
                  onPressed: () {
                    NextPage.next();
                  },
                  text: "Next",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
