import 'package:flutter/material.dart';
import 'package:gaad_mobile/models/category.dart';

import '../pages/CategoryListPage.dart';
import 'categoryicon.dart';

class TokenCpfCard extends StatelessWidget {
  Category? category;

  Function? onCardClick;

  TokenCpfCard({this.category, this.onCardClick});

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
                "MEUS IDENTIFICADORES ÚNICOS: ",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new Padding(padding: EdgeInsets.only(top: 0.0)),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.numbers,
                    color: Color.fromRGBO(35, 100, 128, 1), size: 45),
                SizedBox(width: 20),
              ],
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Meu Token:",
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
            new Padding(padding: EdgeInsets.only(top: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.perm_identity,
                    color: Color.fromRGBO(35, 100, 128, 1), size: 45),
                SizedBox(width: 20),
              ],
            ),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Meu CPF:",
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
