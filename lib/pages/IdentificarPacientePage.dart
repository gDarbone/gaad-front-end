import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaad_mobile/models/category.dart';
import 'package:gaad_mobile/pages/CategoryListPageMedico.dart';
import 'package:gaad_mobile/pages/RelatorioAddComplicacoes.dart';
import 'package:gaad_mobile/pages/ResultadoIdentificaPacienteToken.dart';
import 'package:gaad_mobile/pages/loginpage.dart';

import '../helpers/utils.dart';
import '../widgets/categorycard.dart';
import '../widgets/categoryicon.dart';
import '../widgets/mainappbar.dart';
import '../widgets/sidemenubar.dart';
import 'RelatorioEditComplicacoes.dart';
import 'RelatorioViewComplicacoes.dart';
import 'ResultadosIdentificaPacienteCPF.dart';
import 'ResultadosIdentificaPacientePlaca.dart';

class IdentificarPacientePage extends StatefulWidget {
  State createState() => new _IdentificarPacientePage();
}

class _IdentificarPacientePage extends State<IdentificarPacientePage> {
  TextEditingController tokenController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController placaController = TextEditingController();

  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';
  List<Category> categories = Utils.getMockedCategories();
  var _value = "Token";
  final items = ['Token', 'CPF', 'Placa do Veiculo'];
  Utils util = new Utils();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    username = arguments['username'];
    password = arguments['password'];

    responseUsuarioLogado = Map<String, dynamic>.from(arguments['responseUsuarioLogado'] as Map);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                child: Center(
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
                    underline: SizedBox(
                    ),
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
            ),
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
                      child:             TextField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        maxLength: 17,
                        keyboardType: TextInputType.number,
                        controller: tokenController,
                        enabled: true,
                        decoration: InputDecoration(
                          labelText: 'Digite o Token: ',
                        ),
                      ),),
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
                    child:             TextField(
                      controller: cpfController,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 11,
                      keyboardType: TextInputType.number,
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: 'Digite o CPF: ',
                      ),
                    ),),
                )),
            Visibility(
                visible: util.isPlacaSelected(_value),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                      width: 250,
                    child:             TextField(
                      controller: placaController,
                      enabled: true,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.singleLineFormatter,
                      ],
                      maxLength: 7,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Digite a Placa do Veiculo: ',
                      ),
                    ),),
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
                      width: 250,
                      child: TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultadoIdentificaPacienteToken(responseUsuarioLogado, username, password, tokenController.text),
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
            Visibility(
                visible: util.isCPFSelected(_value),
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
                              builder: (context) => ResultadoIdentificaPacienteCPF(responseUsuarioLogado, username, password, cpfController.text),
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
            Visibility(
                visible: util.isPlacaSelected(_value),
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
                              builder: (context) => ResultadoIdentificaPacientePlaca(responseUsuarioLogado, username, password, placaController.text),
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
