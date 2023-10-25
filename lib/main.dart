import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CadastroPage.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/ConfiguracaoPage.dart';
import 'package:gaad_mobile/pages/ContatosPage.dart';
import 'package:gaad_mobile/pages/EditProfilePage.dart';
import 'package:gaad_mobile/pages/IdentificarPacientePage.dart';

import 'package:gaad_mobile/pages/PerfilPage.dart';
import 'package:gaad_mobile/pages/IdentificacaoPage.dart';
import 'package:gaad_mobile/pages/RelatorioPage.dart';
import 'package:gaad_mobile/pages/VeiculosPage.dart';
import 'package:gaad_mobile/pages/loginpage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';
import 'package:gaad_mobile/services/categoryselectionservice.dart';
import 'package:provider/provider.dart';

void main() {
  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';

  runApp(MultiProvider(
      providers: [
        Provider(create: (_) => CategorySelectionService())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => SplashPage(duration: 3, goToPage: WelcomePage()),
            '/welcomepage': (context) => WelcomePage(),
            '/loginpage': (context) => loginpage(),
            '/CadastroPage': (context) => CadastroPage(),
            '/CategoryListPage': (context) => CategoryListPage(responseUsuarioLogado, username, password),
            '/PerfilPage': (context) => PerfilPage(),
            '/EditProfilePage': (context) => EditProfilePage(),
            '/RelatorioPage': (context) => RelatorioPage(),
            '/ContatosPage': (context) => ContatosPage(responseUsuarioLogado, username, password),
            '/IdentificacaoPage': (context) => IdentificacaoPage(),
            '/ConfiguracaoPage': (context) => ConfiguracaoPage(),
            '/IdentificarPacientePage': (context) => IdentificarPacientePage(),
            //'/RelatorssioPagse': (context) =>
          })));
}

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });

    return Scaffold(
      body: Center(
        child: Container(
          width: 175,
          height: 250,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/logo gaad.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
