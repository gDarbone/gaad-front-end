import 'package:flutter/material.dart';
import 'package:gaad_mobile/models/category.dart';

import '../helpers/utils.dart';
import '../pages/CategoryListPage.dart';
import 'categoryicon.dart';

class IdentificacaoFacialCard extends StatelessWidget {
  Category? category;

  Function? onCardClick;

  IdentificacaoFacialCard({this.category, this.onCardClick});

  Utils util = new Utils();

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
                "MINHA IDENTIFICACÃO FACIAL: ",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new Padding(padding: EdgeInsets.only(top: 0.0)),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 10))
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                      ))),
            ),
            new Padding(padding: EdgeInsets.only(top: 20.0)),
            util.buildTextField("Ultima Atualização em:", "07/05/2022",false),
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
