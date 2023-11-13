import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/IdentificacaoPage.dart';
import 'package:gaad_mobile/widgets/ComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';
import 'package:http/http.dart' as http;
import '../widgets/TokenCpfCard.dart';
import '../widgets/sidemenubar.dart';
import 'CategoryListPage.dart';
import 'RelatorioPage.dart';

class TokenCpfPage extends StatelessWidget {

  String responseTokenUsuarioLogado = '';
  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';
  TokenCpfPage(this.responseTokenUsuarioLogado, this.responseUsuarioLogado, this.username, this.password);
  Widget typeCard = TokenCpfCard(responseTokenUsuarioLogado: '');


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text('Token'),
        backgroundColor: Color.fromRGBO(35, 100, 128, 1),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        /*decoration: BoxDecoration(
            color: Colors.white
        ),*/

        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext ctx, int index) {
                return Container(
                  //padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                  height: 500,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding:
                          EdgeInsets.only(top: 50, left: 5, right: 5),

                          child: TokenCpfCard(

                            onCardClick: () {}, responseTokenUsuarioLogado: responseTokenUsuarioLogado,
                          ),

                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              color: Colors.white,
              height: 80,
              child: Row(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
