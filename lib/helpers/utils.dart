import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gaad_mobile/helpers/iconhelper.dart';
import 'package:gaad_mobile/widgets/iconfont.dart';

import '../models/category.dart';

class Utils{

  static List<Category> getMockedCategories(){
    return[
      Category(
        color: Colors.transparent,
        name: "Perfil",
        imgName: "perfil1",
        icon: IconFontHelper.PERFIL,
      ),
      Category(
          color: Colors.transparent,
          name: "Relatórios",
          imgName: "relatorio1",
          icon: IconFontHelper.RELATORIO,
      ),
      Category(
          color: Colors.transparent,
          name: "Contatos",
          imgName: "contatos1",
          icon: IconFontHelper.CONTATO,

      ),
      Category(
          color: Colors.transparent,
          name: "Identificação",
          imgName: "identificacao1",
          icon: IconFontHelper.IDENTIFICACAO,

      ),
      Category(
          color: Colors.transparent,
          name: "Configuração",
          imgName: "configuracao1",
          icon: IconFontHelper.CONFIGURACAO,

      ),
      Category(
          color: Colors.transparent,
          //color: Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
          name: "Pedir Socorro",
          imgName: "socorro1",
          icon: IconFontHelper.SOCORRO,

      ),
    ];
  }

  Widget buildTextField(String labelText, String placeholder, bool isEnabled) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            enabled: isEnabled,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}