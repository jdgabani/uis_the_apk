import 'dart:developer';
import 'package:get/get.dart';
import 'package:uis_the_apk/Api/Model/Response_Model/get_all_form_response_model.dart';
import 'package:uis_the_apk/Api/Repo/getallformsrepo.dart';
import 'package:uis_the_apk/Api/api_response.dart';


class GetAllFormsViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // final nameOfTheDeceasedForm1 = TextEditingController();
  // final dateOfDeathForm1 = TextEditingController();
  // final placeOfDeathForm1 = TextEditingController();
  // final numberOnTheUISBraceletForm1 = TextEditingController();
  // final dateTimeAttachedForm1 = TextEditingController();
  // final printedForm1 = TextEditingController();
  // final signatureForm1 = TextEditingController();

  Future<void> getAllFormsViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      GetAllFormsResponseModel response = await GetAllFormsRepo().getAllFormRepo();

      _apiResponse = ApiResponse.complete(response);
      log('GetAllFormsViewModel----response---->>>>>>$response');
      // CommonSnackBar.showSnackBar(
      //     title: response.status, message: response.message);
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());
      // CommonSnackBar.showSnackBar(title: 'Something Went Wrong', message: '');
      log('GetAllFormsViewModel-------->>>>>>$e');
    }
    update();
  }
}