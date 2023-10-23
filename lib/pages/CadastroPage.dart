import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/loginpage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';
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


class CadastroPage extends StatefulWidget {
  final Map? todo;
  const CadastroPage({
    super.key,
    this.todo,
  });

  @override
  State<CadastroPage> createState() => _CadastroPage();
}

class _CadastroPage extends State<CadastroPage> {


  bool isEdit = false;

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
      /*final body = {
        "title": title,
        "description" : description,
        "is_completed": false,
      };*/

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

      final Map<String, dynamic> body = {
      "username": username,
      "email": email,
      "password": senha,
      "confirmPassword": confirmasenha,
      "userPersonalDataRequest": {
      "fullName": nome,
      "cpf": cpf,
      "rg": rg,
      "crm": crn,
      "birthdate": birthdate,
      "sex": sex,
      "nationality": nationality,
      "bloodType": bloodtype
      },
        "userContactRequest":{
          "street":street,
          "cep":cep,
          "houseNumber": houseNumber,
          "cellNumber": cellNumber,
          "alternativeCellNumber":alternativeCellNumber,
          "fullNameAlternativeContact":fullNameAlternativeContact,
          "uf":uf
        }
      };


      // Submit data to the server
      //final url = 'http://api.nstack.in/v1/todos';
      final url = 'http://10.0.2.2:8080/gaad/register';

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
        showSuccessMessage(isEdit? 'Cadastro Editado com Sucesso' : 'Cadastro Adicionado com Sucesso');

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
        showSuccessMessage(isEdit? 'Cadastro Editado com Sucesso' : 'Cadastro Adicionado com Sucesso');
        print('Sucess updated ');
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
              isEdit? 'Editar Cadastro' : 'Adicionar Cadastro'),
          backgroundColor: Color.fromRGBO(35, 100, 128, 1),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Digite o Nome de Usuário',
                labelText: '* Nome de Usuário: ',
              ),

            ),
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                hintText: 'Digite o Nome Completo',
                labelText: '* Nome Completo: ',
              ),

            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Digite o E-mail',
                labelText: '* E-mail:',
              ),
            ),
            TextField(
              controller: dataNascController,
              decoration: InputDecoration(
                hintText: 'Digite a Data de Nascimento',
                labelText: '* Data de Nascimento:',
              ),
            ),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(
                hintText: 'Digite a Senha',
                labelText: '* Senha:',
              ),
            ),
            TextField(
              controller: cpfController,
              decoration: InputDecoration(
                hintText: 'Digite o CPF',
                labelText: '* CPF:',
              ),
            ),
            TextField(
              controller: rgController,
              decoration: InputDecoration(
                hintText: 'Digite o RG',
                labelText: '* RG:',
              ),
            ),
            TextField(
              controller: crmController,
              decoration: InputDecoration(
                hintText: 'Digite o CRM (Caso Seja Profissional de Saúde)',
                labelText: 'CRM (Opcional - Caso Seja Profissional de Sáude):',
              ),
            ),
            TextField(
              controller: sexoController,
              decoration: InputDecoration(
                hintText: 'Digite o Sexo',
                labelText: '* Sexo:',
              ),
            ),
            TextField(
              controller: nacionalidadeController,
              decoration: InputDecoration(
                hintText: 'Digite a Nacionalidade',
                labelText: '* Nacionalidade:',
              ),
            ),
            TextField(
              controller: tiposanguineoController,
              decoration: InputDecoration(
                hintText: 'Digite o Tipo Sanguineo',
                labelText: '* Tipo Sanguineo:',
              ),
            ),
            TextField(
              controller: streetController,
              decoration: InputDecoration(
                hintText: 'Digite o seu Endereço',
                labelText: '* Endereço:',
              ),
            ),
            TextField(
              controller: cepController,
              decoration: InputDecoration(
                hintText: 'Digite o seu CEP',
                labelText: '* CEP:',
              ),
            ),
            TextField(
              controller: houseNumberController,
              decoration: InputDecoration(
                hintText: 'Digite o Número da Residência',
                labelText: '* Numero da Residência:',
              ),
            ),
            TextField(
              controller: cellNumberController,
              decoration: InputDecoration(
                hintText: 'Digite o seu Telefone',
                labelText: '* Telefone:',
              ),
            ),
            TextField(
              controller: alternativeCellNumberController,
              decoration: InputDecoration(
                hintText: 'Digite um Número de Contato Alternativo',
                labelText: '* Número do Contato Alternativo:',
              ),
            ),
            TextField(
              controller: fullNameAlternativeContactController,
              decoration: InputDecoration(
                hintText: 'Digite o Nome do Contato Alternativo',
                labelText: '* Nome do Contato Alternativo:',
              ),
            ),
            TextField(
              controller: ufController,
              decoration: InputDecoration(
                hintText: 'Digite o UF',
                labelText: '* UF:',
              ),
            ),
            SizedBox(height: 20),



            // TESTE API, REMOVER
            /*TextField(
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
            SizedBox(height: 20),*/


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
                    builder: (context) => loginpage(),
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


