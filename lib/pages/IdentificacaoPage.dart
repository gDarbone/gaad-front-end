import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:gaad_mobile/models/category.dart';
import 'package:gaad_mobile/pages/RelatorioAddComplicacoes.dart';
import 'package:gaad_mobile/pages/TokenCpfPage.dart';
import 'package:http/http.dart' as http;
import '../helpers/utils.dart';
import '../widgets/categorycard.dart';
import '../widgets/categoryicon.dart';
import '../widgets/mainappbar.dart';
import '../widgets/sidemenubar.dart';
import 'VeiculosPage.dart';
import 'RelatorioViewComplicacoes.dart';

class IdentificacaoPage extends StatelessWidget {

  String responseTokenUsuarioLogado = '';
  List<Category> categories = Utils.getMockedCategories();
  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    username = arguments['username'];
    password = arguments['password'];
    responseUsuarioLogado = Map<String, dynamic>.from(arguments['responseUsuarioLogado'] as Map);
    getToken();
    return Scaffold(
        appBar: AppBar(
          title: Text('Meios de Identificação'),
          backgroundColor: Color.fromRGBO(35, 100, 128, 1),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(35, 100, 128, 1),
                  Color.fromRGBO(5, 181, 183, 1),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                  "Atualize ou visualize suas opções de Reconhecimento",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Container(
                        padding: EdgeInsets.only(top: 5, left: 50, right: 50),
                        height: 300,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Padding(
                                padding: EdgeInsets.only(top: 50, left: 5, right: 5),
                                child: CategoryCard(
                                  category: categories[3],
                                  onCardClick: () {
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 90, right: 90),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TokenCpfPage(responseTokenUsuarioLogado, responseUsuarioLogado, username, password),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.numbers,
                                    color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Text("Token",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VeiculosPage(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.motorcycle, color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Text("Meus Veiculos",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))
                              ],
                            ),
                          ),

                        ],
                      ),
                    )),
              ],
            )));
  }

  Future<bool> getToken() async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String usernameReceived = username;
    String passwordReceived = password;

    print(username);
    print(password);
    final String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernameReceived:$passwordReceived'));

    var url = 'http://10.0.2.2:8080/gaad/userPersonalData/getSelfToken';
    var resposta = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': basicAuth,
      },
    );
    /*if (resposta.statusCode == 200 ) {
      await sharedPreferences.setString('token', "Token ${jsonDecode(resposta.body)['token']}");
      print('Token ' + jsonDecode(resposta.body));
      //print('Response status: ${response.statusCode}');
      //print('Response body: ${response.body}');
      return true;
    } else {
      print('Resposta do Servidor: ' +jsonDecode(resposta.body));
      return false;
    }*/

    if (resposta.statusCode == 200) {
      // A resposta da API foi bem-sucedida.
      print('Resposta da API: ${resposta.body}');
      responseTokenUsuarioLogado = resposta.body.toString();
      return true;
    } else {
      // Lidar com erros, por exemplo:
      print('Erro na chamada da API: ${resposta.statusCode}');
      return false;
    }

  }
}
