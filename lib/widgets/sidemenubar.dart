import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/CategoryListPageMedico.dart';

import '../pages/loginpage.dart';

class SideMenuBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListPage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.person, color: Color.fromRGBO(35, 100, 128, 1), size: 20),
                    SizedBox(width: 10),
                    Text("Menu Paciente",
                        style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1), fontSize: 20))
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListPageMedico(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.medical_services, color: Color.fromRGBO(35, 100, 128, 1), size: 20),
                    SizedBox(width: 10),
                    Text("Menu Médico",
                        style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1), fontSize: 20))
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginpage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Color.fromRGBO(35, 100, 128, 1), size: 20),
                    SizedBox(width: 10),
                    Text("Sair",
                        style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1), fontSize: 20))
                  ],
                ))
          ],

        ),
      ),
    );
  }
}
