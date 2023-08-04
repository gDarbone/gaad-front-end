import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/RelatorioAddVacinas.dart';
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
import 'RelatorioPage.dart';
import 'RelatorioViewComplicacoes.dart';
import 'RelatorioViewRemedios.dart';

class RelatorioViewVacinas extends StatefulWidget {

  const RelatorioViewVacinas({super.key});

  @override
  State<RelatorioViewVacinas> createState() => _RelatorioViewVacinas();
}


class _RelatorioViewVacinas extends State<RelatorioViewVacinas> {
  bool isLoading = true;
  Widget typeCard = ComplicacoesCard();
  List items = [];


  void initState(){
    fetchTodo();
    super.initState();
  }


  void navigateToRelatorioViewRemedios(){
    final route = MaterialPageRoute(
      builder: (context) => RelatorioViewRemedios(),
    );
    Navigator.pushReplacement(context, route);
  }

  void navigateToEditVacinas(Map item){
    final route = MaterialPageRoute(
      builder: (context) => RelatorioAddVacinas(todo: item),
    );
    Navigator.pushReplacement(context, route);
  }

  Future<void> deleteById(String id) async{
    final url = 'http://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200){
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    }
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
        title: Text('Visualizar Vacinas'),
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
                final id = item['_id'] as String;
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(item['title']),
                  subtitle: Text(item['description']),
                  trailing: PopupMenuButton(
                      onSelected: (value) {
                        if (value == 'edit'){
                          navigateToEditVacinas(item);
                        }else if (value == 'delete'){
                          deleteById(id);
                        }
                      },
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Text('Editar'),
                            value: 'edit',
                          ),
                          PopupMenuItem(
                            child: Text('Deletar'),
                            value: 'delete',
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
        onPressed: navigateToRelatorioViewRemedios,
        label: Text('Remedios'),
      ),
    );
  }
}
