import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset("assets/logo gaad.png"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Precisa de Ajuda?",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Por gentileza, entre em contato com:\n"
                            "\nEmail:\n"
                        "\nf111dir@cps.sp.gov.br"
                            "\nf111adm@cps.sp.gov.br"
                            "\nf111acad@cps.sp.gov.br\n"
                            "\nTelefone: (11) 2026-1303 / 2049-2600\n"
                            "\nSite: http://www.fateczl.edu.br/contato",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 35,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor:
                          Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                          highlightColor:
                          Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                          /*onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryListPage(),
                              ),
                            );
                          },*/
                          onTap: () => Navigator.pop(context, false),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 50.0),
                            child: Text(
                              'Ok',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Color.fromRGBO(35, 100, 128, 1), fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.transparent,
                                border: Border.all(color: Color.fromRGBO(35, 100, 128, 1), width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
