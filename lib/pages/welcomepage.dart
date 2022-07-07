import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';

class WelcomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onTap: () {},
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
                          builder: (context) => CategoryListPage(),
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
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
