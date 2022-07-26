import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/AboutPage.dart';
import 'package:gaad_mobile/pages/DeleteAccount.dart';
import 'package:gaad_mobile/pages/PermissionPage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/utils.dart';
import '../models/category.dart';
import '../widgets/AddContact.dart';
import '../widgets/EditContact.dart';
import '../widgets/mainappbar.dart';
import '../widgets/sidemenubar.dart';
import 'HelpPage.dart';
import 'RecoveryPassword.dart';

class ConfiguracaoPage extends StatelessWidget {

  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        backgroundColor: Color.fromRGBO(35, 100, 128, 1),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Text(
                  "Edite ou visualize suas Configurações",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1)),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.help, color: Color.fromRGBO(35, 100, 128, 1), size: 20),
                      SizedBox(width: 10),
                      Text("Ajuda",
                          style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1), fontSize: 20))
                    ],
                  )),

              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.info, color: Color.fromRGBO(35, 100, 128, 1), size: 20),
                      SizedBox(width: 10),
                      Text("Sobre",
                          style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1), fontSize: 20))
                    ],
                  )),

              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PermissionPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.perm_device_info, color: Color.fromRGBO(35, 100, 128, 1), size: 20),
                      SizedBox(width: 10),
                      Text("Permissões do Aplicativo",
                          style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1), fontSize: 20))
                    ],
                  )),

              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecoveryPassword(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.password, color: Color.fromRGBO(35, 100, 128, 1), size: 20),
                      SizedBox(width: 10),
                      Text("Alterar Minha Senha",
                          style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1), fontSize: 20))
                    ],
                  )),


              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeleteAccount(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.delete_forever, color: Color.fromRGBO(35, 100, 128, 1), size: 20),
                      SizedBox(width: 10),
                      Text("Excluir Minha Conta",
                          style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1), fontSize: 20))
                    ],
                  ))
            ],

          ),
        ),
      ),
    );
  }
}
