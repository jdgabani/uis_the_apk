import 'dart:developer';

import 'package:uis_the_apk/Api/Model/Response_Model/get_all_form_response_model.dart';
import 'package:uis_the_apk/Api/api_handlers.dart';
import 'package:uis_the_apk/Api/api_routs.dart';


class GetAllFormsRepo extends BaseService {
  Future getAllFormRepo() async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: '${BaseService.getAllFormsUrl}8',
    );

    GetAllFormsResponseModel getAllFormsResponseModel =
    GetAllFormsResponseModel.fromJson(response);

    log('-----------------------$response');
    log('-----------------------${BaseService.getAllFormsUrl}');

    return getAllFormsResponseModel;
    }
}