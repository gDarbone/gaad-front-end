import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CadastroPageOne.dart';
import 'CategoryListPageMedico.dart';

class WelcomePage extends StatefulWidget {

  @override
  _WelcomePage createState() => _WelcomePage();
}


class _WelcomePage extends State<WelcomePage> {

  @override
  void initState() {
    super.initState();
    verificarToken().then((value) {
      if(value){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryListPageMedico(),
            ),
          );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => loginpage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );

    /*return Scaffold(
        body: Container(
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
      child: Stack(
        children: [
          Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Bem-vindo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'ZwoWebPro',
                  ),
                ),
                //SizedBox(height: 20,),
                const Text(
                  'Para se conectar conosco\n faça o login ou cadastre-se.',
                  //textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor:
                          Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                      highlightColor:
                          Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CadastroPageOne(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 30.0),
                        child: Text(
                          'Cadastre-se',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 1)),
                      ),
                    )),

                SizedBox(height: 10),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor:
                        Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                    highlightColor:
                        Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => loginpage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 50.0),
                      child: Text(
                        'Entrar',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white, width: 1)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));*/
  }

  Future<bool> verificarToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') ==null) {
      return false;
    } else {
      return true;
    }
  }
}
