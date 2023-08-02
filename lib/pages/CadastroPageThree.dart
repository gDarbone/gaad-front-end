import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CadastroPageTwo.dart';
import 'package:gaad_mobile/pages/loginpage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';

import 'CategoryListPage.dart';

class CadastroPageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment: Alignment(0.0, 1.15),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("assets/logo gaad.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new Padding(padding: EdgeInsets.only(top: 0.0)),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Endereço",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Número",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Contato",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "UF",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Cidade",
                fillColor: Colors.blue,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
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
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => CadastroPageTwo(),
                    //     ),
                    //   );
                    // },
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
                    onTap: () {
                      if (2 == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryListPage(),
                        ),
                      );
                      } else {
                        Widget cadastroButton = TextButton(
                          child: Text("Entendido"),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CadastroPageThree(),
                            ),
                          ),
                        );
                        AlertDialog alert = AlertDialog(
                          title: Text("CRM Inválido."),
                          content: Text(
                              "O CRM Digitado está incorreto ou Inválido. Por favor Verifique o Campo."),
                          actions: [
                            cadastroButton,
                          ],
                        );
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return alert;
    },
    );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 40.0),
                      child: Text(
                        'Cadastrar',
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
            SizedBox(
              height: 10,
            ),
            /*Column(
              //height: 40,
              //alignment: Alignment.center,
              children: [
                FlatButton(
                child: Text(
                  "Cancelar",
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
             ],
            ),*/
          ],
        ),
      ),
    );
  }
}
