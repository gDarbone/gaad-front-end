import 'package:flutter/material.dart';
import 'package:gaad_mobile/models/category.dart';

import '../pages/CategoryListPage.dart';
import 'categoryicon.dart';

class ComplicacoesCard extends StatelessWidget {
  Category? category;

  Function? onCardClick;

  ComplicacoesCard({this.category, this.onCardClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onCardClick!();
      },

      child: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "COMPLICAÇÕES: ",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new Padding(padding: EdgeInsets.only(top: 0.0)),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Nome:",
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
                labelText: "Categoria:",
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
                labelText: "Observação/Descrição:",
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
            SizedBox(
              height: 20,
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
