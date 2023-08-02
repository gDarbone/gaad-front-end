import 'dart:convert';

import 'package:flutter/material.dart';
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
import 'RelatorioViewVacinas.dart';

class RelatorioViewComplicacoes extends StatefulWidget {

  const RelatorioViewComplicacoes({super.key});

  @override
  State<RelatorioViewComplicacoes> createState() => _RelatorioViewComplicacoes();
}


class _RelatorioViewComplicacoes extends State<RelatorioViewComplicacoes> {
  bool isLoading = true;
  Widget typeCard = ComplicacoesCard();
  List items = [];


  void initState(){
    fetchTodo();
    super.initState();
  }

  void navigateToRelatorioComplicacoes(){
    final route = MaterialPageRoute(
      builder: (context) => RelatorioViewComplicacoes(),
    );
    Navigator.pushReplacement(context, route);
  }

  void navigateToRelatorioViewVacinas(){
    final route = MaterialPageRoute(
      builder: (context) => RelatorioViewVacinas(),
    );
    Navigator.pushReplacement(context, route);
  }

  void navigateToRelatorioViewRemedios(){
    final route = MaterialPageRoute(
      builder: (context) => RelatorioViewRemedios(),
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
        title: Text('Visualizar Complicações'),
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
                textColor: Colors.black,
              );
            }
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToRelatorioViewVacinas,
        label: Text('Vacinas'),
      ),
    );
  }
}
