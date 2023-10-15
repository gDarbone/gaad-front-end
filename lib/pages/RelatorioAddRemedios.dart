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


class RelatorioAddRemedios extends StatefulWidget {
  final Map? todo;
  const RelatorioAddRemedios({
    super.key,
    this.todo,
  });

  @override
  State<RelatorioAddRemedios> createState() => _RelatorioAddRemedios();
  }

  class _RelatorioAddRemedios extends State<RelatorioAddRemedios> {
  Widget typeCard = ComplicacoesCard();
  bool isEdit = false;

  TextEditingController nomeController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();
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
        showSuccessMessage(isEdit? 'Remédio Editado com Sucesso' :'Remédio Adicionado com Sucesso');

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
        showSuccessMessage(isEdit? 'Remédio Editado com Sucesso' : 'Remédio Adicionado com Sucesso');
        print('Sucess updated ');
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(isEdit? 'Editar Remédio' : 'Adicionar Remédios'),
          backgroundColor: Color.fromRGBO(35, 100, 128, 1),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                hintText: 'Digite o Nome do Remédio',
                labelText: 'Nome do Remédio: ',
              ),

            ),
            TextField(
              controller: quantidadeController,
              decoration: InputDecoration(
                hintText: 'Digite a Categoria',
                labelText: 'Categoria:',
              ),
            ),
            TextField(
              controller: ultimaController,
              decoration: InputDecoration(
                hintText: 'Digite a Data de Inicio da Dosagem',
                labelText: 'Data da Dosagem:',
              ),
            ),
            TextField(
              controller: observacoesController,
              decoration: InputDecoration(
                hintText: 'Deseja incluir alguma Observaçaõ?',
                labelText: 'Observações:',
              ),
              minLines: 5,
              maxLines: 8,
              keyboardType: TextInputType.multiline,
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
                    builder: (context) => CategoryListPage(),
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
            Container(
                height: 80,
                child: RelatorioBar()
            ),

          ],
        )
    );
  }
}
