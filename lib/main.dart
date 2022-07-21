import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CadastroPageOne.dart';
import 'package:gaad_mobile/pages/CadastroPageThree.dart';
import 'package:gaad_mobile/pages/CadastroPageTwo.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/ContatosPage.dart';
import 'package:gaad_mobile/pages/EditProfilePage.dart';
<<<<<<< HEAD
=======
import 'package:gaad_mobile/pages/PerfilPage.dart';
import 'package:gaad_mobile/pages/IdentificacaoPage.dart';
>>>>>>> 67df23bc3101dec8834f72948d1974e9fb32d7bd
import 'package:gaad_mobile/pages/RelatorioPage.dart';
import 'package:gaad_mobile/pages/loginpage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';
import 'package:gaad_mobile/services/categoryselectionservice.dart';
import 'package:provider/provider.dart';

void main() {
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
            '/CadastroPageOne': (context) => CadastroPageOne(),
            '/CadastroPageTwo': (context) => CadastroPageTwo(),
            '/CadastroPageThree': (context) => CadastroPageThree(),
            '/CategoryListPage': (context) => CategoryListPage(),
            '/EditProfilePage': (context) => EditProfilePage(),
            '/RelatorioPage': (context) => RelatorioPage(),
<<<<<<< HEAD
            '/ContatosPage': (context) => ContatosPage(),
=======
            '/IdentificacaoPage': (context) => IdentificacaoPage(),
            //'/RelatorioPagse': (context) =>
>>>>>>> 67df23bc3101dec8834f72948d1974e9fb32d7bd
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
