import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/ResultadosIdentificaPacienteCPFPerfil.dart';
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

class ResultadoIdentificaPacienteCPFContatos extends StatefulWidget {
  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';
  String cpf = '';
  ResultadoIdentificaPacienteCPFContatos(this.responseUsuarioLogado, this.username, this.password, this.cpf,{
    super.key,
  });

  @override
  State<ResultadoIdentificaPacienteCPFContatos> createState() => _ResultadoIdentificaPacienteCPFContatos();
}


class _ResultadoIdentificaPacienteCPFContatos extends State<ResultadoIdentificaPacienteCPFContatos> {
  bool isLoading = true;
  Widget typeCard = ComplicacoesCard();
  List items = [];


  void initState(){
    fetchTodo();
    super.initState();
  }

  void navigateToResultadoIdentificaPaciente(){
    final route = MaterialPageRoute(
      builder: (context) => ResultadoIdentificaPacienteCPFPerfil(widget.responseUsuarioLogado, widget.username, widget.password, widget.cpf),
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
    final String cpfRecebido = widget.cpf;
    final String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usuario:$senha'));

    final url = 'http://10.0.2.2:8080/gaad/userPersonalData/getByCpf/$cpfRecebido';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': basicAuth,
      },
    );
    if (response.statusCode != 401){

      final Map<String, dynamic> convertido = json.decode(response.body);
      //final Map<String, dynamic> convertido = json.decode('{"id":1,"fullName":"Adryen Simoes","cpf":"86136231077","rg":"376538934","crm":"","birthdate":"2000-09-19T00:00:00.000+00:00","sex":"M","nationality":"Brasileiro","bloodType":"O - ","sicks":[{"id":6,"name":"Contato X","type":"Parentesco W","obs":"11923902290"},{"id":7,"name":"Contato GA","type":"Parentesco AB","obs":"11923902290"},{"id":8,"name":"Contato 12","type":"Parentesco FG","obs":"11923902290"}],"vehicles":[{"id":null,"name":"Madza RX","model":"V2","year":2010,"plate":"ABCD123","userPersonalDataRequest":null}]}');
      print(convertido);
      final result = convertido['emergencyContactRequests'] as List;
      //print(widget.responseUsuarioLogado["sicks"]);
      //final List result = widget.responseUsuarioLogado["sicks"];

      setState(() {
        items = result;
      });
    } else {
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
        title: Text('Visualizar Dados do Paciente'),
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
                  title: Text(item['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Parentesco: " + item['obs']),
                      Text("Telefone: " + item['cellNumber']),
                    ],
                  ),
                );
              }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToResultadoIdentificaPaciente,
        label: Text('Perfil do Paciente'),
      ),
    );
  }
}
