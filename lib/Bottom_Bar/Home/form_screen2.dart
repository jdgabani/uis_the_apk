import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:uis_the_apk/Controller/form.dart';
import 'package:uis_the_apk/Controller/variable.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/common_textformfield.dart';
import 'package:uis_the_apk/Screens/Common_Widgets/elevated_button.dart';

class FormScreen2 extends StatefulWidget {
  const FormScreen2({Key? key}) : super(key: key);

  @override
  State<FormScreen2> createState() => _FormScreen2State();
}

class _FormScreen2State extends State<FormScreen2> {
  DateFormat format = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 21.25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.4.w),
            child: Text(
              'Name of Funeral/Other Representative Taking \nCustody of the Deceased',
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
              controller: Controller.funeralPrintedForm2,
              validator: (value) {
                return null;
              },
              hintText: "Printed",
              obscureText: false),
          SizedBox(
            height: 14.h,
          ),
          CommonTextFormField(
              controller: Controller.funeralSignatureForm2,
              validator: (value) {
                return null;
              },
              hintText: "Signature",
              obscureText: false),
          SizedBox(
            height: 14.h,
          ),
          CommonTextFormField(
              controller: Controller.funeralDateTimeForm2,
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
                    Controller.funeralDateTimeForm2.text =
                        format.format(value!).toString();
                    setState(() {});
                  });
                  setState(() {});
                },
                icon: const Icon(Icons.calendar_today),
              ),
              obscureText: false),
          SizedBox(
            height: 35.h,
          ),
          Text(
            'Name of Crematory/Cemetery Representative Taking \nCustody of the Deceased',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          CommonTextFormField(
              controller: Controller.crematoryPrintedForm2,
              validator: (value) {
                return null;
              },
              hintText: "Printed",
              obscureText: false),
          SizedBox(
            height: 14.h,
          ),
          CommonTextFormField(
              controller: Controller.crematorySignatureForm2,
              validator: (value) {
                return null;
              },
              hintText: "Signature",
              obscureText: false),
          SizedBox(
            height: 14.h,
          ),
          CommonTextFormField(
              controller: Controller.crematoryDateTimeForm2,
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
                      Controller.crematoryDateTimeForm2.text =
                          format.format(value!).toString();
                      setState(() {});
                    });
                    setState(() {});
                  },
                  icon: const Icon(Icons.calendar_today)),
              obscureText: false),
          SizedBox(
            height: 104.h,
          ),
          Row(
            children: [
              CommonElevatedPerviousButton(
                onPressed: () {
                  NextPage.previous();
                },
              ),
              SizedBox(
                width: 146.w,
              ),
              CommonElevatedSmallButton(
                onPressed: () {
                  NextPage.next();
                },
                text: "Next",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
