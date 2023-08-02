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
import 'CadastroPageOne.dart';

class RelatorioAddVacinas extends StatelessWidget {

  Widget typeCard = ComplicacoesCard();

  TextEditingController nomeController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();
  TextEditingController ultimaController = TextEditingController();
  TextEditingController observacoesController = TextEditingController();

  // TESTE API, REMOVER
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
        showSuccessMessage('Vacina Adicionada com Sucesso');

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

    return Scaffold(
        appBar: AppBar(
          title: Text('Adicionar Vacinas'),
          backgroundColor: Color.fromRGBO(35, 100, 128, 1),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                hintText: 'Digite o Nome da Vacina',
                labelText: 'Nome da Vacina: ',
              ),

            ),
            TextField(
              controller: quantidadeController,
              decoration: InputDecoration(
                hintText: 'Digite a Quantidade de Doses',
                labelText: 'Quantidade de Doses:',
              ),
            ),
            TextField(
              controller: ultimaController,
              decoration: InputDecoration(
                hintText: 'Digite a Data da Ultima Dose',
                labelText: 'Data da Ultima Dose:',
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
              onPressed: (){
                submitData();
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
              child: Text("Adicionar"),),

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
    /*return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Vacinas'),
        backgroundColor: Color.fromRGBO(35, 100, 128, 1),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        /*decoration: BoxDecoration(
            color: Colors.white
        ),*/
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    //padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                    height: 400,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 50, left: 5, right: 5),

                            child: VacinasCard(
                              onCardClick: () {},
                            ),

                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                color: Colors.white,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Material(

                      color: Colors.transparent,
                      child: InkWell(
                        splashColor:
                        Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                        highlightColor:
                        Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                        onTap: () => Navigator.pop(context, false),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 57.0),
                          child: Text(
                            'Voltar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(35, 100, 128, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.transparent,
                              border: Border.all(
                                  color: Color.fromRGBO(35, 100, 128, 1),
                                  width: 2)),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(

                        splashColor:
                        Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                        highlightColor:
                        Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                        onTap: () => Navigator.pop(context, false),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 50.0),
                          child: Text(
                            'Adicionar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(35, 100, 128, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.transparent,
                              border: Border.all(
                                  color: Color.fromRGBO(35, 100, 128, 1),
                                  width: 2)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
                child: RelatorioBar()
            ),

          ],

      ),
    );
  }*/

}
