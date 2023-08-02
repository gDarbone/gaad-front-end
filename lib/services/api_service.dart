import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:gaad_mobile/helpers/constants.dart';
import 'package:gaad_mobile/models/user_personal_data_model.dart';
import 'dart:convert';

class ApiService {
  Future<List<UserPersonalDataModel>?> getPersonalData() async {
    /*final uri = Uri(
      scheme: 'http',
      host: 'localhost',
      port: 8080, // altere para a porta desejada
      path: '/gaad/userPersonalData/get',
    );*/
    /*try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserPersonalDataModel> _model = userPersonalDataModelFromJson(response.body);
        return _model;
      } else {
          throw new Exception("Deu Bosta");
      }
    } catch (e) {
      log(e.toString());
    }
  }*/


    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/gaad/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{

          "username":"adryen",
          "email":"adryen.simoes@outlook.com",
          "password":"12345678",
          "confirmPassword":"12345678",
          "userPersonalDataRequest":{
            "fullName": "Adryen Simoes",
            "cpf": "1231213412",
            "rg": "123412312",
            "birthdate": "2001-07-07",
            "sex": "Masculino",
            "nationality": "Brasileiro",
            "bloodType": "O+"
          },
          "userContactRequest":{
            "street":"asasas",
            "district":"asdsa",
            "cep":"03687010",
            "houseNumber":"241",
            "cellNumber":"112312312",
            "alternativeCellNumber":"11213123",
            "fullNameAlternativeContact":"Danona",
            "uf":"SP"
          }
        }
      ),
    );

    if (response.statusCode == 200) {
      // Sucesso!
      print(response.body);
    } else {
      // Erro ao chamar a API
      print('Erro ao chamar a API: ${response.statusCode}');
    }
  }
}