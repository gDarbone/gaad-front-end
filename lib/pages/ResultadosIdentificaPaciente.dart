import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaad_mobile/widgets/AddContact.dart';
import 'package:gaad_mobile/widgets/ComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/RelatorioBar.dart';
import 'package:gaad_mobile/widgets/RelatorioComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/RelatorioRemediosCard.dart';
import 'package:gaad_mobile/widgets/RelatorioVacinasCard.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';
import 'package:http/http.dart' as http;
import '../widgets/RelatorioViewBar.dart';
import '../widgets/sidemenubar.dart';
import 'CategoryListPage.dart';
import 'IdentificarPacientePage.dart';
import 'RelatorioPage.dart';
import 'RelatorioViewComplicacoes.dart';
import 'RelatorioViewRemedios.dart';
import 'RelatorioViewVacinas.dart';

class ResultadoIdentificaPaciente extends StatefulWidget {

  const ResultadoIdentificaPaciente({super.key});

  @override
  State<ResultadoIdentificaPaciente> createState() => _ResultadoIdentificaPaciente();
}


class _ResultadoIdentificaPaciente extends State<ResultadoIdentificaPaciente> {
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



  Future<void> fetchTodo() async {
    setState(() {
      isLoading = true;
    });
    final url =  'http://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200){
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState(() {
        items = result;
      });
    }
    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados de Pacientes'),
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
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(item['title']),
                  subtitle: Text(item['description']),
                  trailing: PopupMenuButton(
                      onSelected: (value) {
                        if (value == 'relatorios'){

                        }else if (value == 'veiculos'){

                        }else if (value == 'contatos'){

                        }else if (value == 'perfil'){

                        }
                      },
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Text('Relatórios'),
                            value: 'relatorios',
                          ),
                          PopupMenuItem(
                            child: Text('Veiculos'),
                            value: 'veiculos',
                          ),
                          PopupMenuItem(
                            child: Text('Contatos de Emergência'),
                            value: 'contatos',
                          ),
                          PopupMenuItem(
                            child: Text('Perfil do Paciente'),
                            value: 'perfil',
                          ),
                        ];
                      }
                  ),
                );
              }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToResultadoIdentificaPaciente,
        label: Text('Pesquisar Novamente'),
      ),
    );
  }
}
