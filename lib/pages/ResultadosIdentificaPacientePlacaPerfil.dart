import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaad_mobile/widgets/ComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/RelatorioComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/RelatorioRemediosCard.dart';
import 'package:gaad_mobile/widgets/RelatorioVacinasCard.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';
import 'package:http/http.dart' as http;
import '../widgets/sidemenubar.dart';
import 'CategoryListPage.dart';
import 'IdentificarPacientePage.dart';
import 'RelatorioAddComplicacoes.dart';
import 'RelatorioPage.dart';
import 'RelatorioViewComplicacoes.dart';

class ResultadoIdentificaPacientePlacaPerfil extends StatefulWidget {
  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';
  String placa = '';
  ResultadoIdentificaPacientePlacaPerfil(this.responseUsuarioLogado, this.username, this.password, this.placa,{
    super.key,
  });

  @override
  State<ResultadoIdentificaPacientePlacaPerfil> createState() => _ResultadoIdentificaPacientePlacaPerfil();
}


class _ResultadoIdentificaPacientePlacaPerfil extends State<ResultadoIdentificaPacientePlacaPerfil> {
  bool isLoading = true;
  Widget typeCard = ComplicacoesCard();
  List items = [];


  void initState(){
    fetchTodo();
    super.initState();
  }

  void navigateToResultadoIdentificaPaciente(){
    final route = MaterialPageRoute(
      builder: (context) => IdentificarPacientePage(),
    );
    Navigator.pushReplacement(context, route);
  }




  Future<void> deleteById(String id) async{
  }

  Future<void> fetchTodo() async {
    setState(() {
      isLoading = true;
    });
    final String usuario = widget.username;
    final String senha = widget.password;
    final String placaRecebido = widget.placa;
    final String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usuario:$senha'));

    final url = 'http://10.0.2.2:8080/gaad/userPersonalData/getByVehiclePlate/$placaRecebido';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': basicAuth,
      },
    );
    if (response.statusCode != 401 && response.statusCode != 404){

      final Map<String, dynamic> convertido = json.decode(response.body);
      print(convertido);
      final resultObj = [] as List;
      final jsonObj = <String, dynamic>{
    "data" : [{
        'id': convertido["id"],
        'fullName': convertido["fullName"],
        'cpf': convertido["cpf"],
        'rg': convertido["rg"],
        'sex': convertido["sex"],
        'nationality': convertido["nationality"],
        'bloodType': convertido["bloodType"]
    }]
      };
      print(jsonObj);
      final result  = jsonObj["data"] as List;
      //print(widget.responseUsuarioLogado["sicks"]);
      //final List result = widget.responseUsuarioLogado["sicks"];

      setState(() {
        items = result;
      });
    } else{
      // set up the button
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Não Encontrado"),
        content: Text("Não foram encontrados dados."),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );

      print(response.body);
    }
    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Dados de Perfil do Paciente'),
        backgroundColor: Color.fromRGBO(35, 100, 128, 1),
      ),
      body: Visibility (
        visible: isLoading,
        child: Center(child: CircularProgressIndicator(),),
        replacement: RefreshIndicator(
          onRefresh: fetchTodo,
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index] as Map;
                //final id = item['id'] as int;
                final id = 0;
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(item['fullName']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("CPF: " + item['cpf']),
                      Text("RG: " + item['rg'].toString()),
                      Text("Sexo: " + item['sex']),
                      Text("Nacionalidade: " + item['nationality']),
                      Text("Tipo Sanguineo: " + item['bloodType']),
                    ],
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
