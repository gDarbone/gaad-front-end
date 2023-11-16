import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/RelatorioPage.dart';
import 'package:gaad_mobile/widgets/ComplicacoesCard.dart';

import 'package:gaad_mobile/widgets/VacinasCard.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';
import 'package:http/http.dart' as http;
import '../widgets/sidemenubar.dart';
import 'CadastroPage.dart';


class RelatorioAddComplicacoes extends StatefulWidget {
  final Map? todo;
  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';
   RelatorioAddComplicacoes(this.responseUsuarioLogado, this.username, this.password, {
    super.key,
    this.todo,
  });




  @override
  State<RelatorioAddComplicacoes> createState() => _RelatorioAddComplicacoes();
  }

  class _RelatorioAddComplicacoes extends State<RelatorioAddComplicacoes> {
  Widget typeCard = ComplicacoesCard();
  bool isEdit = false;

  TextEditingController nomeController = TextEditingController();
  TextEditingController categoriaController = TextEditingController();
  TextEditingController ultimaController = TextEditingController();
  TextEditingController observacoesController = TextEditingController();

  // TESTE API, REMOVER
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();



  void initState(){
    super.initState();
    final todo = widget.todo;
    if(todo != null) {
      isEdit = true;
      final title = todo['title'];
      final description = todo['description'];
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    void showSuccessMessage(String message){
      final snackBar = SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void showErrorMessage(String message){
      final snackBar = SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    Future<void> submitData() async{

      // Get the data from form

      //final nome = nomeController.text;
      //final ultima = ultimaController.text;
      //final quantidade = quantidadeController.text;
      //final observacoes = observacoesController.text;

      // TESTE API, AJUSTAR
      final title = titleController.text;
      final description = descriptionController.text;


      final name = nomeController.text;
      final obs = observacoesController.text;
      final type = categoriaController.text;

      if (name == null || name.isEmpty || obs == null || obs.isEmpty || type == null || type.isEmpty){
        showErrorMessage('Existem Campos em Branco, Favor Verificar.');
      } else{



      final Map<String, dynamic> body = {
        "id": 0,
        "name": name,
        "obs": obs,
        "type": type
      };

      final String usuario = widget.username;
      final String senha = widget.password;

      final String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$usuario:$senha'));

      // Submit data to the server
      //final url = 'http://api.nstack.in/v1/todos';
      final url = 'http://10.0.2.2:8080/gaad/sick/post';

      final uri = Uri.parse(url);
      http.post(uri);
      final response = await http.post(
          uri,
          body: jsonEncode(body),
          headers: {
            'Authorization': basicAuth,
            'Content-Type': 'application/json'
          }
      );


      // show success or fail message based on status
      if (response.statusCode == 201 || response.statusCode == 200){
        nomeController.clear();
        categoriaController.clear();
        observacoesController.clear();
        showSuccessMessage(isEdit? 'Cadastro Editado com Sucesso' : 'Cadastro Realizado com Sucesso');

        print('Sucess: ');
        print(response.statusCode);
        print(response.body);

      } else {
        showErrorMessage('Campos Inválidos ou API indisponível');
        showErrorMessage(response.body);
        print('Error: ');
        print(response.statusCode);
        print(response.body);
      }


      }
    }

    Future<void> updateData() async {
      // Get the data from form
      final todo = widget.todo;
      if (todo == null){
        print('chamada de update incorreta');
        return;
      }

      final id = todo['_id'];
      //final isCompleted = todo['is_completed'];
      //final nome = nomeController.text;
      //final ultima = ultimaController.text;
      //final observacoes = observacoesController.text;

      // TESTE API, AJUSTAR
      final title = titleController.text;
      final description = descriptionController.text;

      // TESTE API, AJUSTAR
      final body = {
        "title": title,
        "description" : description,
        "is_completed": false,
      };

      final url = 'http://api.nstack.in/v1/todos/$id';
      final uri = Uri.parse(url);
      http.post(uri);
      final response = await http.put(
          uri,
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json'
          }
      );

      if (response.statusCode == 201 || response.statusCode == 200){
        showSuccessMessage(isEdit? 'Complicação Editada com Sucesso' : 'Complicação Adicionada com Sucesso');
        print('Sucess updated ');
      }
    }

      return Scaffold(
        appBar: AppBar(
          title: Text(
              isEdit? 'Editar Complicação' : 'Adicionar Complicações'),
          backgroundColor: Color.fromRGBO(35, 100, 128, 1),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                hintText: 'Digite o Nome da Complicação, Remédio ou Vacina',
                labelText: 'Nome da Complicação, Remédio ou Vacina: ',
              ),

            ),
            TextField(
              controller: categoriaController,
              decoration: InputDecoration(
                hintText: 'Digite a Categoria',
                labelText: 'Categoria:',
              ),
            ),
            TextField(
              controller: observacoesController,
              decoration: InputDecoration(
                hintText: 'Deseja incluir alguma Observação?',
                labelText: 'Observações:',
              ),
              minLines: 5,
              maxLines: 8,
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 20),


            SizedBox(height: 20),


            ElevatedButton(
              onPressed: isEdit? updateData : submitData,

              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(35, 100, 128, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color.fromRGBO(35, 100, 128, 1))
                      )
                  )
              ),
              child: Text(isEdit? 'Editar' : "Adicionar"),),

            ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryListPage(widget.responseUsuarioLogado, widget.username, widget.password),
                  ),
                );
              },

              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(35, 100, 128, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color.fromRGBO(35, 100, 128, 1))
                      )
                  )
              ),
              child: Text("Cancelar"),),
            SizedBox(width: 10),

          ],
        )
    );
  }
}
