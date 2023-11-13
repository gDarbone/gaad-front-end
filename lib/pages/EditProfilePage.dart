import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/CategoryListPageMedico.dart';
import 'package:gaad_mobile/pages/RelatorioPage.dart';
import 'package:gaad_mobile/widgets/ComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/VacinasCard.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';
import 'package:http/http.dart' as http;
import '../widgets/sidemenubar.dart';
import 'CadastroPage.dart';
import 'package:date_format/date_format.dart';

class EditProfilePage extends StatefulWidget {
  final Map? todo;
  const EditProfilePage({
    super.key,
    this.todo,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePage();
}

class _EditProfilePage extends State<EditProfilePage> {
  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';
  bool isEdit = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dataNascController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController crmController = TextEditingController();
  TextEditingController sexoController = TextEditingController();
  TextEditingController nacionalidadeController = TextEditingController();
  TextEditingController tiposanguineoController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController cellNumberController = TextEditingController();
  TextEditingController alternativeCellNumberController = TextEditingController();
  TextEditingController fullNameAlternativeContactController = TextEditingController();
  TextEditingController ufController = TextEditingController();



  void initState(){
    super.initState();
    final todo = widget.todo;
    if(todo != null) {
      isEdit = false;
      final title = todo['title'];
      final description = todo['description'];
    }

  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    username = arguments['username'];
    password = arguments['password'];

    responseUsuarioLogado = Map<String, dynamic>.from(arguments['responseUsuarioLogado'] as Map);

    //print(usernameReceived);
    //print(passwordReceived);
    //print(responseUsuarioLogado);

    usernameController.text = username;
    nomeController.text = responseUsuarioLogado["fullName"].toString();


    // CONVERTENDO DATA DE NASC
    var localDate = DateTime.parse(responseUsuarioLogado["birthdate"].toString()).toLocal();
    var localDateFormatted = formatDate(localDate, [dd, '/', mm, '/', yyyy]);
    dataNascController.text = localDateFormatted;

    cpfController.text = responseUsuarioLogado["cpf"].toString();
    rgController.text = responseUsuarioLogado["rg"].toString();
    crmController.text = responseUsuarioLogado["crm"].toString();
    sexoController.text = responseUsuarioLogado["sex"].toString();
    nacionalidadeController.text = responseUsuarioLogado["nationality"].toString();
    tiposanguineoController.text = responseUsuarioLogado["bloodType"].toString();

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
      /*final body = {
        "title": title,
        "description" : description,
        "is_completed": false,
      };*/


      // Submit data to the server
      /*final url = 'http://api.nstack.in/v1/todos';
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
        showSuccessMessage(isEdit? 'Perfil Editado com Sucesso' : 'Perfil Adicionado com Sucesso');

        print('Sucess: ');
        print(response.statusCode);
        print(response.body);
      } else {

        showErrorMessage('Campos Inválidos ou API indisponível');

        print('Error: ');
        print(response.statusCode);
        print(response.body);
      }*/

    }

    Future<void> updateData() async {
      // Get the data from form
      /*final todo = widget.todo;
      if (todo == null){
        print('chamada de update incorreta');
        return;
      }

      final id = todo['_id'];

      final username = usernameController.text;
      final cpf = cpfController.text;
      final rg = rgController.text;
      final crn = crmController.text;
      final birthdate = dataNascController.text;
      final sex = sexoController.text;
      final nationality = nacionalidadeController.text;
      final bloodtype = tiposanguineoController.text;

      final nome = nomeController.text;
      final email = emailController.text;
      final senha = senhaController.text;
      final confirmasenha = senhaController.text;

      final street = streetController.text;
      final cep = cepController.text;
      final houseNumber = houseNumberController.text;
      final cellNumber = cellNumberController.text;
      final alternativeCellNumber = alternativeCellNumberController.text;
      final fullNameAlternativeContact = fullNameAlternativeContactController.text;
      final uf = ufController.text;

      //final isCompleted = todo['is_completed'];
      //final nome = nomeController.text;
      //final ultima = ultimaController.text;
      //final observacoes = observacoesController.text;


      // TESTE API, AJUSTAR
      /*final body = {
        "title": title,
        "description" : description,
        "is_completed": false,
      };*/

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
      }*/
    }

    return Scaffold(

        appBar: AppBar(
          title: Text(
              isEdit? 'Visualizar Perfil' : 'Visualizar Perfil'),
          backgroundColor: Color.fromRGBO(35, 100, 128, 1),
        ),
        body: ListView(

          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: usernameController,
              enabled: false,
              decoration: InputDecoration(
                labelText: 'E-mail do Usuário: ',
              ),
            ),
            TextField(
              controller: nomeController,
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Nome Completo: ',
              ),

            ),
            TextField(
              controller: dataNascController,
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Digite a Data de Nascimento',
                labelText: 'Data de Nascimento:',
              ),
              //minLines: 5,
              //maxLines: 8,
              //keyboardType: TextInputType.multiline,
            ),
            TextField(
              controller: cpfController,
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Digite o CPF',
                labelText: 'CPF:',
              ),
            ),
            TextField(
              controller: rgController,
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Digite o RG',
                labelText: 'RG:',
              ),
            ),
            TextField(
              controller: crmController,
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Digite o CRM (Caso Seja Profissional de Saúde)',
                labelText: 'CRM:',
              ),
            ),
            TextField(
              controller: sexoController,
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Digite o Sexo',
                labelText: 'Sexo:',
              ),
            ),
            TextField(
              controller: nacionalidadeController,
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Digite a Nacionalidade',
                labelText: 'Nacionalidade:',
              ),
            ),
            TextField(
              controller: tiposanguineoController,
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Digite o Tipo Sanguineo',
                labelText: 'Tipo Sanguineo:',
              ),
            ),

            SizedBox(height: 20),



            /*ElevatedButton(
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
              child: Text(isEdit? 'Editar' : "Adicionar"),),*/

            ElevatedButton(
              onPressed: (){
                //print("Chegou no Menu");
                //print(args);
                if (crmController.text == ""){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListPage(responseUsuarioLogado, username, password),
                    ),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListPageMedico(responseUsuarioLogado, username, password),
                    ),
                  );
                }
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
              child: Text("Ok"),),
            SizedBox(width: 10),

          ],
        )
    );
  }
}
