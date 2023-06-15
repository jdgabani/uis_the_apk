// `import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'dart:ui' as ui;
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
//
//
// class FormScreen extends StatefulWidget {
//   const FormScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FormScreen> createState() => _FormScreenState();
// }
//
// class _FormScreenState extends State<FormScreen> {
//   /// Form 1 ///
//   final nameControllerForm1 = TextEditingController();
//   final dateInputForm1 = TextEditingController();
//   final placeControllerForm1 = TextEditingController();
//   final stateController = TextEditingController();
//   final cityController = TextEditingController();
//   final numberControllerForm1 = TextEditingController();
//   final dateTimeAttachedControllerForm1 = TextEditingController();
//   final phoneNumberController = TextEditingController();
//   final printedForm1 = TextEditingController();
//   final signatureForm1 = TextEditingController();
//
//   String imageBand = "";
//
//   final _key1 = GlobalKey<FormState>();
//   final _key2 = GlobalKey<FormState>();
//   final _key3 = GlobalKey<FormState>();
//   String signature1 = "";
//   String signature2 = "";
//   String signature3 = "";
//   String signature4 = "";
//   String signature5 = "";
//
//
//   File? signatureFile1;
//   File? signatureFile2;
//   File? signatureFile3;
//   File? signatureFile4;
//   File? signatureFile5;
//
//   ///Form 2///
//   // final printedForm2 = TextEditingController();
//   final directorName = TextEditingController();
//   final signatureForm2 = TextEditingController();
//   final addressController = TextEditingController();
//   final dateInputForm2 = TextEditingController();
//   final printedForm2Phase2 = TextEditingController();
//   final signatureForm2Phase2 = TextEditingController();
//   final dateInputForm2Phase2 = TextEditingController();
//
//   ///Form 3///
//   final printedForm3 = TextEditingController();
//   final relationShipForm3 = TextEditingController();
//   final signatureForm3 = TextEditingController();
//   final dateInputForm3 = TextEditingController();
//   final printedForm3Phase3 = TextEditingController();
//   final signatureForm3Phase3 = TextEditingController();
//   final dateInputForm3Phase3 = TextEditingController();
//
//   PageController? pageController;
//   String? selectedCountryName;
//   String? selectedCountryId;
//   List<String> countryName = [];
//
//   String? selectedStateName;
//   String? selectedStateId;
//   List<String> stateName = [];
//
//   // ByteData _img = ByteData(0);
//   var color = Colors.red;
//
//   @override
//   void initState() {
//     pageController = PageController(
//       initialPage: 0,
//     );
//     getCountryList();
//     dateInputForm1.text = "";
//     dateInputForm2.text = "";
//     dateInputForm2Phase2.text = "";
//     dateInputForm3.text = "";
//     dateInputForm3Phase3.text = "";
//     super.initState();
//   }
//
//   int selector = 0;
//   List scroll = [0];
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//         builder: (controller) {
//       return Scaffold(
//           backgroundColor: Colors.grey.shade100,
//           appBar: AppBar(
//             elevation: 0,
//             leading: selector == 0
//                 ? GestureDetector(
//               child: Icon(Icons.arrow_back_ios,
//                   color: Colors.black, size: 20.sp),
//               onTap: () {
//                 controller.selected(1);
//               },
//             )
//                 : SizedBox(),
//             actions: [
//               selector == 2
//                   ? Padding(
//                 padding: EdgeInsets.only(right: 25.w),
//                 child: SvgPicture.asset(
//                   'assets/images/preview.svg',
//                   height: 37.h,
//                   width: 37.w,
//                 ),
//               )
//                   : SizedBox()
//             ],
//             title: Text(
//               'Form',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20.sp,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             centerTitle: true,
//             backgroundColor: Colors.grey.shade100,
//           ),
//           body: GetBuilder<FormViewModel>(builder: (formController) {
//         return SingleChildScrollView(
//             child: Stack(
//             children: [
//             Container(
//             height: Get.height,
//             width: Get.width,
//             child: Column(
//             children: [
//             Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//     child: Row(
//     children: List.generate(
//     3,
//     (index) => Expanded(
//     child: Container(
//     height: 3.h,
//     width: 123.w,
//     margin: EdgeInsets.symmetric(horizontal: 6.w),
//     decoration: BoxDecoration(
//     color: scroll.contains(index)
//     ? PickColor.secondaryColor
//         : const Color(0xffDBDBDB),
//     ),
//     ),
//     ),
//     ),
//     ),
//     ),
//     SizedBox(height: 40.h),
//     Container(
//     height: selector == 0 ? 700.h : 600.h,
//     width: MediaQuery.of(context).size.width,
//
//     // color: Colors.red,
//     child: PageView(
//     controller: pageController,
//     physics: const NeverScrollableScrollPhysics(),
//     onPageChanged: (value) {
//     setState(() {
//     selector = value;
//     print(selector);
//     });
//     if (scroll.contains(selector)) {
//     print('CONTAIN');
//     } else {
//     scroll.add(selector);
//     }
//     if (scroll.last > selector) {
//     scroll.remove(scroll.last);
//
//     print('REMOVE DATA $scroll');
//     }
//
//     print('message=====$scroll');
//     },
//     children: [
//     SingleChildScrollView(
//     child: Padding(
//     padding: const EdgeInsets.symmetric(
//     horizontal: 20),
//     child: Form(
//     key: _key1,
//     child: Column(
//     children: [
//     CommonTextFormField(
//     obscureText: false,
//     controller: nameControllerForm1,
//     validator: (value) {
//     if (value!.trim().isEmpty) {
//     return 'This field is required';
//     }
//     return null;
//     },
//     hintText: 'Name of the Deceased',
//     ),
//     SizedBox(height: 14.h),
//     GestureDetector(
//     onTap: () async {
//     DateTime? pickedDate =
//     await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(2000),
//     lastDate: DateTime(2101));
//     if (pickedDate != null) {
//     print(pickedDate);
//     String formattedDate =
//     DateFormat('yyyy-MM-dd')
//         .format(pickedDate);
//     print(formattedDate);
//
//     setState(() {
//     dateInputForm1.text =
//     formattedDate;
//     });
//     } else {
//     print("Date is not selected");
//     }
//     },
//     child: TextFormField(
//     controller: dateInputForm1,
//     enabled: false,
//     maxLines: 1,
//     validator: (value) {
//     if (value!.trim().isEmpty) {
//     return 'This field is required';
//     }
//     return null;
//     },
//     decoration: InputDecoration(
//     disabledBorder:
//     const OutlineInputBorder(
//     borderSide: BorderSide(
//     color: PickColor
//         .borderColor)),
//     contentPadding:
//     EdgeInsets.symmetric(
//     vertical: 15.h,
//     horizontal: 19.w),
//     suffixIcon: const Icon(
//     Icons.calendar_today_outlined,
//     size: 20,
//     color: Color(0xff555555)),
//     filled: true,
//     fillColor: PickColor.fillColor,
//     hintText: 'Date of Death',
//     hintStyle: TextStyle(
//     color: PickColor.hintColor,
//     fontSize: 14.sp),
//     focusedBorder: OutlineInputBorder(
//     borderRadius:
//     BorderRadius.circular(
//     6.r),
//     borderSide: const BorderSide(
//     color: PickColor
//         .borderColor)),
//     enabledBorder: OutlineInputBorder(
//     borderRadius:
//     BorderRadius.circular(
//     6.r),
//     borderSide: const BorderSide(
//     color: PickColor
//         .borderColor)),
//     errorBorder: OutlineInputBorder(
//     borderRadius:
//     BorderRadius.circular(
//     6.r),
//     borderSide: BorderSide(
//     color: Colors.red)),
//     focusedErrorBorder:
//     OutlineInputBorder(
//     borderRadius:
//     BorderRadius.circular(
//     6.r),
//     borderSide: BorderSide(
//     color: Colors.red)),
//     ),
//     ),
//     ),
//     SizedBox(height: 14.h),
//     Container(
//     height: Get.height * 0.06,
//     width: Get.width,
//     decoration: BoxDecoration(
//     borderRadius:
//     BorderRadius.circular(6.r),
//     color: PickColor.fillColor,
//     border: Border.all(
//     color:
//     PickColor.borderColor)),
//     child: Padding(
//     padding: EdgeInsets.symmetric(
//     horizontal: 20.w),
//     child: DropdownButton<String>(
//     hint: Text("Select Country",
//     style: TextStyle(
//     color:
//     PickColor.hintColor,
//     fontSize: 14.sp)),
//     isExpanded: true,
//     value: selectedCountryName,
//     underline: SizedBox(),
//     items: countryName
//         .map((String value) {
//     return DropdownMenuItem<String>(
//     value: value,
//     child: Text(value),
//     );
//     }).toList(),
//     onChanged: (String? value) {
//     log('name--->${value!}');
//
//     setState(() {
//     selectedCountryName = value;
//
//     signUpViewModel.country
//         .forEach((element) {
//     log('element.id.toString();-------->>>>>>${element.id.toString()}');
//     if (element.name == value) {
//     selectedCountryId =
//     element.id.toString();
//     }
//     });
//
//     selectedStateName = null;
//     selectedStateId = null;
//
//     setState(() {});
//     log("selectedCountryId===>${selectedCountryId}");
//     log("selectedCountryName===>${selectedCountryName}");
//     if ((selectedCountryId ?? '')
//         .isNotEmpty) {
//     getStates(
//     countryCode:
//     selectedCountryId ??
//     '');
//     }
//     });
//     },
//     ),
//     ),
//     ),
//     SizedBox(height: 14.h),
//
//     Container(
//     height: Get.height * 0.06,
//     width: Get.width,
//     decoration: BoxDecoration(
//     borderRadius:
//     BorderRadius.circular(6.r),
//     color: PickColor.fillColor,
//     border: Border.all(
//     color:
//     PickColor.borderColor)),
//     child: Padding(
//     padding: EdgeInsets.symmetric(
//     horizontal: 20.w),
//     child: DropdownButton<String>(
//     hint: Text("Select State",
//     style: TextStyle(
//     color:
//     PickColor.hintColor,
//     fontSize: 14.sp)),
//     isExpanded: true,
//     value: selectedStateName,
//     underline: SizedBox(),
//     items:
//     stateName.map((String value) {
//     return DropdownMenuItem<String>(
//     value: value,
//     child: Text(value),
//     );
//     }).toList(),
//     onChanged: (String? value) {
//     log('State name--->${value!}');
//
//     setState(() {
//     selectedStateName = value;
//
//     signUpViewModel.state
//         .forEach((element) {
//     log('element.id.toString();-------->>>>>>${element.id.toString()}');
//     if (element.name == value) {
//     selectedStateId =
//     element.id.toString();
//     }
//     });
//
//     setState(() {});
//     log("selectedStateId===>${selectedStateId}");
//     });
//     },
//     ),
//     ),
//     ),
//
//     // CommonTextFormField(
//     //   obscureText: false,
//     //   controller: stateController,
//     //   validator: (value) {
//     //     if (value!.trim().isEmpty) {
//     //       return 'This field is required';
//     //     }
//     //     return null;
//     //   },
//     //   hintText: 'Enter state',
//     // ),
//     SizedBox(height: 14.h),
//     // CommonTextFormField(
//     //   obscureText: false,
//     //   controller: cityController,
//     //   validator: (value) {
//     //     if (value!.trim().isEmpty) {
//     //       return 'This field is required';
//     //     }
//     //     return null;
//     //   },
//     //   hintText: 'Enter city',
//     // ),
//     // SizedBox(height: 14.h),
//     CommonTextFormField(
//     obscureText: false,
// `