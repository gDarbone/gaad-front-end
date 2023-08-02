import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';

import '../helpers/utils.dart';


class RelatorioRemediosCard extends StatefulWidget {
  @override
  _RelatorioRemediosCard createState() => _RelatorioRemediosCard();
}

class _RelatorioRemediosCard extends State<RelatorioRemediosCard> {

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
              util.buildTextField("Nome:", "Zolpidem", false),
              util.buildTextField("Data de Inicio da Dosagem:", "11/09/2000", false),
              util.buildTextField("Categoria:", "Depressão", false),
              util.buildTextField("Observação/Descrição:", "Tomar Diariamente", false),
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
