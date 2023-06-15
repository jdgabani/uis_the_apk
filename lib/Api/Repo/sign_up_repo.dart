import 'dart:developer';

import 'package:uis_the_apk/Api/Model/Response_Model/sign_up_response_model.dart';
import 'package:uis_the_apk/Api/api_handlers.dart';
import 'package:uis_the_apk/Api/api_routs.dart';

class SignUpRepo extends BaseService {
  static Future signUpRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: BaseService.signUpUrl, body: body);
    print('++++++++++++++++++++++++RESPONSE   $response');
    SignUpResponseModel signUpResponseModel =
    SignUpResponseModel.fromJson(response);

    log('-----------------------$signUpResponseModel');
    log('-----------------------${BaseService.signUpUrl}');
    return signUpResponseModel;
  }
}