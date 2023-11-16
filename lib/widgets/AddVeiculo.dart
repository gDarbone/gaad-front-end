import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/RelatorioPage.dart';
import 'package:gaad_mobile/widgets/ComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/VacinasCard.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';
import 'package:http/http.dart' as http;
import '../widgets/sidemenubar.dart';


class AddVeiculo extends StatefulWidget {
  final Map? todo;
  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';
  AddVeiculo(this.responseUsuarioLogado, this.username, this.password, {
    super.key,
    this.todo,
  });

  @override
  State<AddVeiculo> createState() => _AddVeiculo();
}

class _AddVeiculo extends State<AddVeiculo> {
  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';
  Widget typeCard = ComplicacoesCard();
  bool isEdit = false;

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
      //final quantidade = quantidadeController.text;
      //final observacoes = observacoesController.text;

      // TESTE API, AJUSTAR
      final title = titleController.text;
      final description = descriptionController.text;


      final name = veiculoController.text;
      final model = modeloController.text;
      final plate = placaController.text;
      final year = anoController.text;

      if (name == null || name.isEmpty || model == null || model.isEmpty || plate == null || plate.isEmpty || year == null || year.isEmpty){
        showErrorMessage('Existem Campos em Branco, Favor Verificar.');
      } else{

      final Map<String, dynamic> body = {
        "id": 0,
        "model": model,
        "name": name,
        "plate": plate,
        "year": year
      };

      final String usuario = widget.username;
      final String senha = widget.password;
      print(usuario);
      print(senha);
      final String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$usuario:$senha'));

      // Submit data to the server
      //final url = 'http://api.nstack.in/v1/todos';
      final url = 'http://10.0.2.2:8080/gaad/userPersonalData/addVehicle';

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
        veiculoController.clear();
        placaController.clear();
        anoController.clear();
        modeloController.clear();
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
        showSuccessMessage(isEdit? 'Veiculo Editado com Sucesso' : 'Veiculo Adicionado com Sucesso');
        print('Sucess updated ');
      } else {
        showErrorMessage('Campos Inválidos ou API indisponível');
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(isEdit? 'Editar Veiculos' : 'Adicionar Veiculos'),
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
              controller: modeloController,
              decoration: InputDecoration(
                hintText: 'Digite o Modelo',
                labelText: 'Nome do Modelo:',
              ),
            ),
            TextField(
              controller: anoController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              maxLength: 4,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Digite o Ano de Fabricação',
                labelText: 'Ano:',
              ),
            ),
            TextField(
              controller: placaController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              maxLength: 7,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Digite o Número da Placa',
                labelText: 'Número da Placa:',
              ),
            ),
            SizedBox(height: 20),



            // TESTE API, REMOVER
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
              child: Text(isEdit? 'Editar' :"Adicionar"),),

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
