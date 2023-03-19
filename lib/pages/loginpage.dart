import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';

import 'CategoryListPageMedico.dart';
import 'RecoveryPassword.dart';

class loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  }
}
