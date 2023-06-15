import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:uis_the_apk/Api/Model/Response_Model/get_all_form_response_model.dart';
import 'package:uis_the_apk/Api/View_model/get_all_forms_view_model.dart';
import 'package:uis_the_apk/Constants/colors.dart';
import 'package:uis_the_apk/Api/api_response.dart'as status;

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  GetAllFormsViewModel getAllFormsViewModel = Get.put(GetAllFormsViewModel());

  @override
  void initState() {
    getAllFormsViewModel.getAllFormsViewModel();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetAllFormsViewModel>(
      builder: (controller) {
        if (controller.apiResponse.status==status.Status.COMPLETE)
        {
          GetAllFormsResponseModel responseModel = controller.apiResponse.data;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              leading: GestureDetector(
                child:
                Icon(Icons.arrow_back_ios, color: Colors.black, size: 20.sp),
                onTap: () {},
              ),
              title: Text(
                'History',
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
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: responseModel.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60.h,
                          width: 388.w,
                          margin: EdgeInsets.symmetric(
                              vertical: 6.h, horizontal: 1.9.w),
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      responseModel.data[index].deceasedName,
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Date of Death:",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(0xff848484),
                                          ),
                                        ),
                                        Text(
                                          " 26-03-2021",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  height: 30.h,
                                  width: 98.w,
                                  decoration: BoxDecoration(
                                    color: PickColor.secondaryColor,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "View Details",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }


        else if (controller.apiResponse.status==status.Status.LOADING){
          return const Center(child: SpinKitFadingCircle(
            color: PickColor.secondaryColor,
            size: 30,
          ));
        }

        else{
          return Center(
            child: Text("Something went Wrong",style: TextStyle(fontSize: 30.sp),),
          );
        }
      }
    );
  }
}
