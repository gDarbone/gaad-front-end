import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/RelatorioPage.dart';
import 'package:gaad_mobile/widgets/ComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/RelatorioBar.dart';
import 'package:gaad_mobile/widgets/VacinasCard.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';
import 'package:http/http.dart' as http;
import '../widgets/sidemenubar.dart';
import 'CadastroPage.dart';


class EditVeiculos extends StatefulWidget {
  final Map? todo;
  const EditVeiculos({
    super.key,
    this.todo,
  });

  @override
  State<EditVeiculos> createState() => _EditVeiculos();
}

class _EditVeiculos extends State<EditVeiculos> {

  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';
  bool isEdit = true;

  TextEditingController veiculoController = TextEditingController();
  TextEditingController fabricanteController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController anoController = TextEditingController();
  TextEditingController corController = TextEditingController();
  TextEditingController placaController = TextEditingController();

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


      // Submit data to the server
      final url = 'http://api.nstack.in/v1/todos';
      final uri = Uri.parse(url);
      http.post(uri);
      final response = await http.post(
          uri,
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json'
          }
      );


      // show success or fail message based on status
      if (response.statusCode == 201 || response.statusCode == 200){
        titleController.clear();
        descriptionController.clear();
        showSuccessMessage(isEdit? 'Perfil Editado com Sucesso' : 'Perfil Adicionado com Sucesso');

        print('Sucess: ');
        print(response.statusCode);
        print(response.body);
      } else {

        showErrorMessage('Campos Inválidos ou API indisponível');

        print('Error: ');
        print(response.statusCode);
        print(response.body);
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
        showSuccessMessage(isEdit? 'Perfil Editado com Sucesso' : 'Perfil Adicionado com Sucesso');
        print('Sucess updated ');
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
              isEdit? 'Editar Perfil' : 'Adicionar Perfil'),
          backgroundColor: Color.fromRGBO(35, 100, 128, 1),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: veiculoController,
              decoration: InputDecoration(
                hintText: 'Digite o Nome do Veiculo',
                labelText: 'Nome do Veiculo: ',
              ),

            ),
            TextField(
              controller: fabricanteController,
              decoration: InputDecoration(
                hintText: 'Digite o Fabricante',
                labelText: 'Nome do Fabricante:',
              ),
            ),
            TextField(
              controller: modeloController,
              decoration: InputDecoration(
                hintText: 'Digite o Modelo',
                labelText: 'Nome do Modelo:',
              ),
            ),
            TextField(
              controller: anoController,
              decoration: InputDecoration(
                hintText: 'Digite o Ano de Fabricação',
                labelText: 'Ano:',
              ),
            ),
            TextField(
              controller: corController,
              decoration: InputDecoration(
                hintText: 'Digite a Cor',
                labelText: 'Cor:',
              ),
            ),
            TextField(
              controller: placaController,
              decoration: InputDecoration(
                hintText: 'Digite o Número da Placa',
                labelText: 'Número da Placa:',
              ),
            ),
            SizedBox(height: 20),



            // TESTE API, REMOVER
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Digite seu Titulo: ',
                labelText: 'Title:',
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Digite sua Descrição: ',
                labelText: 'Description:',
              ),
              minLines: 5,
              maxLines: 8,
              keyboardType: TextInputType.multiline,
            ),
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
                    builder: (context) => CategoryListPage(responseUsuarioLogado, username, password),
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
