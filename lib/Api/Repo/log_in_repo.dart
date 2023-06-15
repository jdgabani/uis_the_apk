import 'dart:developer';
import 'package:uis_the_apk/Api/Model/Response_Model/log_in_response_model.dart';
import 'package:uis_the_apk/Api/api_handlers.dart';
import 'package:uis_the_apk/Api/api_routs.dart';



class LogInRepo extends BaseService {
  static Future logInRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: BaseService.loginUrl, body: body);
    print('++++++++++++++++++++++++RESPONSE   $response');
    LogInResponseModel logInResponseModel =
    LogInResponseModel.fromJson(response);

    log('-----------------------$response');
    log('-----------------------${BaseService.loginUrl}');
    return logInResponseModel;
  }
}