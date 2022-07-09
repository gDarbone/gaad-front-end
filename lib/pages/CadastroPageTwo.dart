import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CadastroPageOne.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';

import 'CadastroPageThree.dart';

class CadastroPageTwo extends StatelessWidget {
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
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "CPF",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "RG",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "CRM",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Sexo",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Nacionalidade",
                fillColor: Colors.blue,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CadastroPageOne(),
                        ),
                      );
                    },
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CadastroPageThree(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 50.0),
                      child: Text(
                        'Avançar',
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
