import 'package:flutter/material.dart';
import 'package:gaad_mobile/helpers/utils.dart';
import 'package:gaad_mobile/pages/loginpage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';

import '../pages/ContatosPage.dart';

class EditContact extends StatelessWidget {
  bool showPassword = false;

  Utils util = new Utils();
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
                "Contatos: ",
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
            util.buildTextField("Nome", "Gabriel Darbone",true),
            util.buildTextField("Parentesco", "Irmão",true),
            util.buildTextField("Telefone", "123123123",true),

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
                              "Suas alterações foram salvas com sucesso, você será redirecionado para a tela de contatos."),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ContatosPage(),
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
                        'Ok',
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
          ],
        ),
      ),
    );
  }

}
