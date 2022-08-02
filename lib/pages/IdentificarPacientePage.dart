import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:gaad_mobile/models/category.dart';
import 'package:gaad_mobile/pages/CategoryListPageMedico.dart';
import 'package:gaad_mobile/pages/RelatorioAddComplicacoes.dart';

import '../helpers/utils.dart';
import '../widgets/categorycard.dart';
import '../widgets/categoryicon.dart';
import '../widgets/mainappbar.dart';
import '../widgets/sidemenubar.dart';
import 'RelatorioEditComplicacoes.dart';
import 'RelatorioViewComplicacoes.dart';

class IdentificarPacientePage extends StatefulWidget {
  State createState() => new _IdentificarPacientePage();
}

class _IdentificarPacientePage extends State<IdentificarPacientePage> {
  List<Category> categories = Utils.getMockedCategories();
  var _value = "Token";
  final items = ['Nome Completo', 'Token', 'CPF', 'Reconhecimento Facial'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Identificar Paciente'),
            backgroundColor: Color.fromRGBO(35, 100, 128, 1),
          ),
          body: Container(
            width: 500,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(35, 100, 128, 1),
                  Color.fromRGBO(5, 181, 183, 1),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    "Selecione o Método de Busca do Paciente",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    width: 250,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: new DropdownButton(
                      dropdownColor: Colors.white,
                      style: TextStyle(
                        color: Color.fromRGBO(35, 100, 128, 1),
                        backgroundColor: Colors.white,
                      ),
                      value: _value,
                      items: items
                          .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                          .toList(),
                      icon: Icon(Icons.arrow_drop_down, color: Color.fromRGBO(35, 100, 128, 1)),
                      iconSize: 30,
                      underline: SizedBox(),
                      onChanged: (String? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                    ),
                  )
                ),
              ],
            ),
          ),
    );
  }
}
