import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';

import '../helpers/utils.dart';


class EditComplicacoesCard extends StatefulWidget {
  @override
  _EditComplicacoesCard createState() => _EditComplicacoesCard();
}

class _EditComplicacoesCard extends State<EditComplicacoesCard> {

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
              util.buildTextField("Nome", "Inflamação no Pescoço", true),
              util.buildTextField("Categoria:", "Cancer", true),
              util.buildTextField("Observação/Descrição:", "Apenas 6 meses de vida", true),
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
