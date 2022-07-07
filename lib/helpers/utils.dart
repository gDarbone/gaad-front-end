import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gaad_mobile/helpers/iconhelper.dart';
import 'package:gaad_mobile/models/subcategory.dart';
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
        subCategories: [
          SubCategory(
            color: Colors.black,
            name: "Meus Dados",
            imgName: IconFontHelper.PERFIL
          ),
          SubCategory(
              color: Colors.black,
              name: "Meu Token",
              imgName: IconFontHelper.PERFIL
          ),
          SubCategory(
              color: Colors.black,
              name: "Excluir Conta",
              imgName: IconFontHelper.PERFIL
          ),
          SubCategory(
              color: Colors.black,
              name: "Alterar Senha",
              imgName: IconFontHelper.PERFIL
          )
        ]
      ),
      Category(
          color: Colors.transparent,
          name: "Relatórios",
          imgName: "relatorio1",
          icon: IconFontHelper.RELATORIO,
          subCategories: []
      ),
      Category(
          color: Colors.transparent,
          name: "Contatos",
          imgName: "contatos1",
          icon: IconFontHelper.CONTATO,
          subCategories: []
      ),
      Category(
          color: Colors.transparent,
          name: "Identificação",
          imgName: "identificacao1",
          icon: IconFontHelper.IDENTIFICACAO,
          subCategories: []
      ),
      Category(
          color: Colors.transparent,
          name: "Configuração",
          imgName: "configuracao1",
          icon: IconFontHelper.CONFIGURACAO,
          subCategories: []
      ),
      Category(
          color: Colors.transparent,
          //color: Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
          name: "Pedir Socorro",
          imgName: "socorro1",
          icon: IconFontHelper.SOCORRO,
          subCategories: []
      ),
    ];
  }
}