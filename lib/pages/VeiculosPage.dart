import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gaad_mobile/widgets/AddContact.dart';
import 'package:gaad_mobile/widgets/AddVeiculo.dart';
import 'package:gaad_mobile/widgets/ComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/EditVeiculo.dart';
import 'package:gaad_mobile/widgets/RelatorioComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/RelatorioRemediosCard.dart';
import 'package:gaad_mobile/widgets/RelatorioVacinasCard.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';
import 'package:http/http.dart' as http;
import '../widgets/sidemenubar.dart';
import 'CategoryListPage.dart';
import 'EditVeiculos.dart';
import 'RelatorioPage.dart';
import 'RelatorioViewComplicacoes.dart';

class VeiculosPage extends StatefulWidget {
  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';
  VeiculosPage(this.responseUsuarioLogado, this.username, this.password, {
    super.key,
  });

  @override
  State<VeiculosPage> createState() => _VeiculosPage();
}


class _VeiculosPage extends State<VeiculosPage> {

  bool isLoading = true;
  Widget typeCard = ComplicacoesCard();
  List items = [];

  void initState(){
    fetchTodo();
    super.initState();
  }

  Future<void> deleteById(String id) async{
  }


  /*Future<void> fetchTodo() async {
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
  }*/

  Future<void> fetchTodo() async {
    setState(() {
      isLoading = true;
    });
    final String usuario = widget.username;
    final String senha = widget.password;
    print(usuario);
    print(senha);
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
      final result = convertido['vehicles'] as List;
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
        title: Text('Meus Veiculos'),
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
                      Text("Modelo: " + item['model']),
                      Text("Placa: " + item['plate']),
                      Text("Ano: " + item['year'].toString()),
                    ],
                  ),
                    trailing: PopupMenuButton(
                      onSelected: (value) {
                        if (value == 'edit'){

                        }else if (value == 'delete'){
                          deleteById(id as String);
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
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddVeiculo(widget.responseUsuarioLogado, widget.username, widget.password),
              ));
        },
        label: Text('Adicionar'),
      ),
    );
  }
}
