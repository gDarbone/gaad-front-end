import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:gaad_mobile/helpers/constants.dart';
import 'package:gaad_mobile/models/user_personal_data_model.dart';

class ApiService {
  Future<List<UserPersonalDataModel>?> getPersonalData() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserPersonalDataModel> _model = userPersonalDataModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}