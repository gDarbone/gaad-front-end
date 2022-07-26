import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';

import '../helpers/utils.dart';


class EditVacinasCard extends StatefulWidget {
  @override
  _EditVacinasCard createState() => _EditVacinasCard();
}

class _EditVacinasCard extends State<EditVacinasCard> {

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
                "VACINA",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 30,
              ),
              util.buildTextField("Nome:", "Pfizer - Covid 19", true),
              util.buildTextField("Quantidade de Doses:", "3", true),
              util.buildTextField("Data da Ultima Dose:", "17/08/2021", true),
              util.buildTextField("Observação/Descrição:", "SUS", true),
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
