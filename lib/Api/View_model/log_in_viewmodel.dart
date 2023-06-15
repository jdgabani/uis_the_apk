import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uis_the_apk/Api/Model/Response_Model/log_in_response_model.dart';
import 'package:uis_the_apk/Api/Repo/log_in_repo.dart';
import 'package:uis_the_apk/Api/api_response.dart';

import '../Repo/log_in_repo.dart';

class LogInViewModel extends GetxController {
  ApiResponse _apiResponseLogin = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponseLogin => _apiResponseLogin;

  final emailLogin = TextEditingController();
  final passwordLogin = TextEditingController();

  Future<void> logInViewModel(Map<String, dynamic> body) async {
    _apiResponseLogin = ApiResponse.loading(message: 'Loading');
    update();
    try {
      LogInResponseModel response = await LogInRepo.logInRepo(body: body);

      print('logInViewModel----response---->>>>>>$response');
      _apiResponseLogin = ApiResponse.complete(response);

      // CommonSnackBar.showSnackBar(
      //     title: response.status, message: response.message);
    } catch (e) {
      _apiResponseLogin = ApiResponse.error(message: e.toString());
      // CommonSnackBar.showSnackBar(title: 'Something Went Wrong', message: '');
      print('logInViewModel-------->>>>>>$e');
    }
    update();
  }
}