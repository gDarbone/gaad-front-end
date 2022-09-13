import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gaad_mobile/helpers/iconhelper.dart';
import 'package:gaad_mobile/widgets/iconfont.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/category.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
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

  static List<Category> getMedicalMockedCategories() {
    return [
      Category(
        color: Colors.transparent,
        name: "Perfil Médico",
        imgName: "perfil1",
        icon: IconFontHelper.PERFILMEDICO,
      ),
      Category(
        color: Colors.transparent,
        name: "Identificar Paciente",
        imgName: "identificacao1",
        icon: IconFontHelper.PESQUISAR,
      ),
      Category(
        color: Colors.transparent,
        name: "Configuração",
        imgName: "configuracao1",
        icon: IconFontHelper.CONFIGURACAO,
      ),
    ];
  }

  String ControleTela(var SubCategoriaSelecionada) {
    var RotaTela = '/welcomepage';
    switch (SubCategoriaSelecionada) {
      case "Perfil":
        RotaTela = '/EditProfilePage';
        break;
      case "Perfil Médico":
        RotaTela = '/EditProfilePage';
        break;
      case "Identificar Paciente":
        RotaTela = '/IdentificarPacientePage';
        break;
      case "Relatórios":
        RotaTela = '/RelatorioPage';
        break;
      case "Contatos":
        RotaTela = '/ContatosPage';
        break;
      case "Identificação":
        RotaTela = '/IdentificacaoPage';
        break;
      case "Configuração":
        RotaTela = '/ConfiguracaoPage';
        break;
      case "Pedir Socorro":
        RotaTela = launchUrl(Uri(scheme: 'tel', path: '192')) as String;
        break;
    }

    return RotaTela;
  }

  bool isNameSelected(var OpcaoSelecionada) {
    switch (OpcaoSelecionada) {
      case "Nome Completo":
        return true;
        break;
      default:
        return false;
        break;
    }
  }

  bool isTknSelected(var OpcaoSelecionada) {
    switch (OpcaoSelecionada) {
      case "Token":
        return true;
        break;
      default:
        return false;
        break;
    }
  }

  bool isCPFSelected(var OpcaoSelecionada) {
    switch (OpcaoSelecionada) {
      case "CPF":
        return true;
        break;
      default:
        return false;
        break;
    }
  }

  bool isPlacaSelected(var OpcaoSelecionada) {
    switch (OpcaoSelecionada) {
      case "Placa do Veiculo":
        return true;
        break;
      default:
        return false;
        break;
    }
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
