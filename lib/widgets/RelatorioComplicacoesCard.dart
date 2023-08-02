import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';

import '../helpers/utils.dart';


class RelatorioComplicacoesCard extends StatefulWidget {
  @override
  _RelatorioComplicacoesCard createState() => _RelatorioComplicacoesCard();
}

class _RelatorioComplicacoesCard extends State<RelatorioComplicacoesCard> {

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
                "COMPLICAÇÃO",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 30,
              ),
              util.buildTextField("Nome", "Inflamação no Pescoço", false),
              util.buildTextField("Categoria:", "Não infecciosa", false),
              util.buildTextField("Observação/Descrição:", "Realizando acompanhamento médico", false),
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
