import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CadastroPageTwo.dart';
import 'package:gaad_mobile/pages/VeiculosPage.dart';
import 'package:gaad_mobile/pages/loginpage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';

import '../pages/ContatosPage.dart';

class AddVeiculo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Meus Veiculos: ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(35, 100, 128, 1),
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new Padding(padding: EdgeInsets.only(top: 0.0)),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Fabricante:",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Modelo:",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Ano",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),

            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Cor",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),

            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Placa",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  borderSide: new BorderSide(),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor:
                        Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                    highlightColor:
                        Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                    onTap: () => Navigator.pop(context, false),
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => CadastroPageTwo(),
                    //     ),
                    //   );
                    // },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 57.0),
                      child: Text(
                        'Voltar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(35, 100, 128, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.transparent,
                          border: Border.all(
                              color: Color.fromRGBO(35, 100, 128, 1),
                              width: 2)),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor:
                        Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                    highlightColor:
                        Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Salvo com Sucesso."),
                          content: Text(
                              "Veiculo adicionado com sucesso."),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VeiculosPage(),
                                  ),
                                ),
                                child: Text("Ok"))
                          ],
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 40.0),
                      child: Text(
                        'Adicionar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(35, 100, 128, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.transparent,
                          border: Border.all(
                              color: Color.fromRGBO(35, 100, 128, 1),
                              width: 2)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            /*Column(
              //height: 40,
              //alignment: Alignment.center,
              children: [
                FlatButton(
                child: Text(
                  "Cancelar",
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
             ],
            ),*/
          ],
        ),
      ),
    );
  }
}
