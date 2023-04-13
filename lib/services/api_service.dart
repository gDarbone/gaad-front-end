import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:helpers/constants.dart';
import 'package:models/user_personal_data_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = UserPersonalDataFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}