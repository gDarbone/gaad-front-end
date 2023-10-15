import 'dart:convert';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
                  } else if (senha.length <6) {
                      return 'Por favor, digite uma senha com mais de 6 caracteres';
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryListPageMedico(),
                        ),
                      );
                    }else {
                      _passwordController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                  // REMOVER APÓS VALIDACAO DO BACKEND
                  else {
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
      )
    );
  }
    /*return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:  40, left: 50, right: 50),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("assets/logo gaad.png"),
            ),
            SizedBox(
              height: 20,
            ),

            TextFormField(
              //autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail ou CRM",
                labelStyle: TextStyle(
                  color: Color.fromRGBO(35, 100, 128, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Color.fromRGBO(35, 100, 128, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color.fromRGBO(35, 100, 128, 1),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecoveryPassword(),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color.fromRGBO(35, 100, 128, 1),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastroPageOne(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20,),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor:
                Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                highlightColor:
                Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListPage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 50.0),
                  child: Text(
                    'Entrar',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Color.fromRGBO(35, 100, 128, 1), fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent,
                      border: Border.all(color: Color.fromRGBO(35, 100, 128, 1), width: 2)),
                ),


              ),
            ),
            SizedBox(height: 20,),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor:
                Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                highlightColor:
                Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListPageMedico(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 50.0),
                  child: Text(
                    'Entrar CRM',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Color.fromRGBO(35, 100, 128, 1), fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent,
                      border: Border.all(color: Color.fromRGBO(35, 100, 128, 1), width: 2)),
                ),


              ),
            ),
          ],
        ),
      ),
    );
  }*/

  final snackBar = SnackBar(
    content: Text(
    'E-mail ou Senha Invalidos!',
    textAlign: TextAlign.center,
  ),
      backgroundColor: Colors.redAccent,
  );

  Future<bool> login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('https://backend.com.br/login');
    var resposta = await http.post(url,
    body: {
        'username' : _emailController.text,
        'password' : _passwordController.text,
        }
    );
    if (resposta.statusCode == 200 ) {
      await sharedPreferences.setString('token', "Token ${jsonDecode(resposta.body)['token']}");
      print('Token ' + jsonDecode(resposta.body)['token']);
      return true;
    } else {
      print('Resposta do Servidor: ' +jsonDecode(resposta.body));
      return false;
    }
  }
}
