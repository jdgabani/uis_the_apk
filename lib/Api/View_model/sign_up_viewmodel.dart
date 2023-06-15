import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uis_the_apk/Api/Model/Response_Model/sign_up_response_model.dart';
import 'package:uis_the_apk/Api/api_response.dart';

import '../Repo/sign_up_repo.dart';

class SignUpViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  final nameSignUp = TextEditingController();
  final emailSignUp = TextEditingController();
  final passwordSignUp = TextEditingController();
  final confirmPasswordSignUp = TextEditingController();

  Future<void> signUpViewModel(Map<String, dynamic> body) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      SignUpResponseModel response = await SignUpRepo.signUpRepo(body: body);

      _apiResponse = ApiResponse.complete(response);
      log('signUpViewModel----response---->>>>>>$response');
      // CommonSnackBar.showSnackBar(
      //     title: response.status, message: response.message);
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());
      // CommonSnackBar.showSnackBar(title: 'Something Went Wrong', message: '');
      log('signUpViewModel-------->>>>>>$e');
    }
    update();
  }
}