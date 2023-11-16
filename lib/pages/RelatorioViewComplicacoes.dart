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
import 'RelatorioAddComplicacoes.dart';
import 'RelatorioPage.dart';
import 'RelatorioViewComplicacoes.dart';

class RelatorioViewComplicacoes extends StatefulWidget {
  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';
  RelatorioViewComplicacoes(this.responseUsuarioLogado, this.username, this.password, {
    super.key,
  });

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



  void navigateToEditComplicacoes(Map item){
    final route = MaterialPageRoute(
      builder: (context) => RelatorioAddComplicacoes(widget.responseUsuarioLogado, widget.username, widget.password),
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
    final String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usuario:$senha'));

    final url = 'http://10.0.2.2:8080/gaad/userPersonalData/get';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': basicAuth,
      },
    );
    if (response.statusCode != 401){

      final Map<String, dynamic> convertido = json.decode(response.body);
      print(convertido);
      final result = convertido['sicks'] as List;
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
              final id = item['id'] as int;
              return ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(item['name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Categoria: " + item['type']),
                    Text("Observação: " + item['obs']),
                  ],
                ),
                trailing: PopupMenuButton(
                    onSelected: (value) {
                      if (value == 'edit'){
                        navigateToEditComplicacoes(item);
                      }else if (value == 'delete'){
                        deleteById(id.toString());
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        /*PopupMenuItem(
                            child: Text('Editar'),
                            value: 'edit',
                          ),
                          PopupMenuItem(
                            child: Text('Deletar'),
                            value: 'delete',
                          ),*/
                      ];
                    }
                ),
              );
            }
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RelatorioAddComplicacoes(widget.responseUsuarioLogado, widget.username, widget.password),
              ));
        },
        label: Text('Adicionar'),
      ),
    );
  }
}
