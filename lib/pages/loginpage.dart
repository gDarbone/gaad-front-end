import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CadastroPage.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'CategoryListPageMedico.dart';
import 'RecoveryPassword.dart';

class loginpage extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Map<String, dynamic> responseUsuarioLogado = {};

  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
        onWillPop: () async{
          return false;
        },
        child:Scaffold(body: Form(
        key: _formkey,
        child: Center (
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/logo gaad.png"),
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
                  child: Text(
                    "Para se conectar conosco\n faça o login ou cadastre-se.",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color.fromRGBO(35, 100, 128, 1),
                    ),
                  ),
                ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Digite seu E-mail',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(35, 100, 128, 1),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (email){
                  if (email == null || email.isEmpty) {
                    return 'Por favor, digite seu E-mail';
                  } else if (!RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text)) {
                    return 'Por favor, digite um E-mail Valido!';
                  }
                  return null;
                }
              ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Digite sua Senha',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(35, 100, 128, 1),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.text,
                validator: (senha){
                  if (senha == null || senha.isEmpty) {
                    return 'Por favor, digite sua Senha';
                  } else if (senha.length <8) {
                      return 'Por favor, digite uma senha com mais de 7 caracteres';
                  }
                  return null;
    }

              ),
              ElevatedButton(
                onPressed: () async{
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (_formkey.currentState!.validate()){
                    var autorizado = await login();
                    if (!currentFocus.hasPrimaryFocus){
                      currentFocus.unfocus();
                    }
                    if(autorizado){
                      print(responseUsuarioLogado["crm"].toString());
                      if (responseUsuarioLogado["crm"] == null || responseUsuarioLogado["crm"].toString() == "" || responseUsuarioLogado["crm"].toString() == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryListPage(responseUsuarioLogado, _emailController.text, _passwordController.text),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryListPageMedico(responseUsuarioLogado, _emailController.text, _passwordController.text),
                          ),
                        );
                      }

                    }else {
                      _passwordController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                  // REMOVER APÓS VALIDACAO DO BACKEND
                  /*else {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus){
                      currentFocus.unfocus();
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryListPageMedico(),
                      ),
                    );
                  }*/
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
                child: Text("Entrar"),),
              SizedBox(width: 10),

              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastroPage(),
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
                child: Text("Cadastre-se"),),
            ],
          ) ,
        ),

      ),
      ),
        )
    );
  }

  final snackBar = SnackBar(
    content: Text(
    'E-mail ou Senha Invalidos!',
    textAlign: TextAlign.center,
  ),
      backgroundColor: Colors.redAccent,
  );

  Future<bool> login() async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String username = _emailController.text;
    String password = _passwordController.text;
    final String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    var url = 'http://10.0.2.2:8080/gaad/userPersonalData/get';
    var resposta = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': basicAuth,
      },
    );
    /*if (resposta.statusCode == 200 ) {
      await sharedPreferences.setString('token', "Token ${jsonDecode(resposta.body)['token']}");
      print('Token ' + jsonDecode(resposta.body));
      //print('Response status: ${response.statusCode}');
      //print('Response body: ${response.body}');
      return true;
    } else {
      print('Resposta do Servidor: ' +jsonDecode(resposta.body));
      return false;
    }*/

    if (resposta.statusCode == 200) {
      // A resposta da API foi bem-sucedida.
      print('Resposta da API: ${resposta.body}');
      responseUsuarioLogado = json.decode(resposta.body);
      print(responseUsuarioLogado);
      return true;
    } else {
      // Lidar com erros, por exemplo:
      print('Erro na chamada da API: ${resposta.statusCode}');
      return false;
    }

  }
}
