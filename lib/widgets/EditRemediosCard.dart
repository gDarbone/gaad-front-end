import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';

import '../helpers/utils.dart';


class EditRemediosCard extends StatefulWidget {
  @override
  _EditRemediosCard createState() => _EditRemediosCard();
}

class _EditRemediosCard extends State<EditRemediosCard> {

  bool showPassword = false;
  Utils util = new Utils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "REMÉDIO",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 30,
              ),
              util.buildTextField("Nome:", "Zolpidem", true),
              util.buildTextField("Data de Inicio da Dosagem:", "11/09/2000", true),
              util.buildTextField("Categoria:", "Depressão", true),
              util.buildTextField("Observação/Descrição:", "Tomar Diariamente", true),
              SizedBox(
                height: 15,
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
