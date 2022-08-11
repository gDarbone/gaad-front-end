import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:gaad_mobile/models/category.dart';
import 'package:gaad_mobile/pages/CategoryListPageMedico.dart';
import 'package:gaad_mobile/pages/RelatorioAddComplicacoes.dart';
import 'package:gaad_mobile/pages/loginpage.dart';

import '../helpers/utils.dart';
import '../widgets/categorycard.dart';
import '../widgets/categoryicon.dart';
import '../widgets/mainappbar.dart';
import '../widgets/sidemenubar.dart';
import 'RelatorioEditComplicacoes.dart';
import 'RelatorioViewComplicacoes.dart';
import 'ResultadosIdentificaPaciente.dart';

class IdentificarPacientePage extends StatefulWidget {
  State createState() => new _IdentificarPacientePage();
}

class _IdentificarPacientePage extends State<IdentificarPacientePage> {
  List<Category> categories = Utils.getMockedCategories();
  var _value = "Token";
  final items = ['Nome Completo', 'Token', 'CPF', 'Reconhecimento Facial'];
  Utils util = new Utils();

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
                "Selecione o método de busca do paciente",
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
                    borderRadius: BorderRadius.circular(20)),
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
                  icon: Icon(Icons.arrow_drop_down,
                      color: Color.fromRGBO(35, 100, 128, 1)),
                  iconSize: 30,
                  underline: SizedBox(),
                  onChanged: (String? value) {
                    setState(
                      () {
                        _value = value!;
                      },
                    );
                  },
                ),
              ),
            ),
            Visibility(
                visible: util.isNameSelected(_value),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                      width: 350,
                      child: util.buildTextField(
                          "Digite o Nome Completo:", "Adryen Simoes", true)),
                )),
            Visibility(
                visible: util.isTknSelected(_value),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                      width: 250,
                      child: util.buildTextField(
                          "Digite o Token:", "#@3o092AA", true)),
                )),
            Visibility(
                visible: util.isCPFSelected(_value),

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                      width: 250,
                      child: util.buildTextField(
                          "Digite o CPF:", "123.345.678-90", true)),
                )),
            Visibility(
                visible: util.isFaceSelected(_value),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      width: 250,
                      child: TextButton(
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => loginpage(),
                                ),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Icon(Icons.face_unlock_outlined, color: Color.fromRGBO(35, 100, 128, 1), size: 20),
                                SizedBox(width: 10),
                                Text("Abrir Câmera",
                                    style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1), fontSize: 15))
                              ],
                            ),
                          ))),
                )),
            Visibility(
                visible: !util.isFaceSelected(_value),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      width: 250,
                      child: TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultadoIdentificaPaciente(),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Icon(Icons.search, color: Color.fromRGBO(35, 100, 128, 1), size: 20),
                                SizedBox(width: 10),
                                Text("Buscar Paciente",
                                    style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1), fontSize: 15))
                              ],
                            ),
                          ))),
                )),
          ],
        ),
      ),
    );
  }
}
