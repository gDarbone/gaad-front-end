import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/RelatorioViewVacinas.dart';
import 'package:gaad_mobile/widgets/RemediosCard.dart';
import 'package:gaad_mobile/widgets/VacinasCard.dart';
import '../pages/RelatorioAddComplicacoes.dart';
import '../pages/RelatorioAddRemedios.dart';
import '../pages/RelatorioAddVacinas.dart';
import '../pages/RelatorioEditComplicacoes.dart';
import '../pages/RelatorioEditRemedios.dart';
import '../pages/RelatorioEditVacinas.dart';
import '../pages/RelatorioViewComplicacoes.dart';
import '../pages/RelatorioViewRemedios.dart';
import 'ComplicacoesCard.dart';

class RelatorioEditBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(35, 100, 128, 1),
        boxShadow: [
          BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.2),
              offset: Offset.zero)
        ],
      ),
      height: 80,
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.sick, color: Color.fromRGBO(35, 100, 128, 1))
                ,
                tooltip: "Complicações",
                onPressed: () {
                  Navigator.pop(context, false);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RelatorioEditComplicacoes(),
                      ));
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(
                    Icons.vaccines, color: Color.fromRGBO(35, 100, 128, 1)),
                tooltip: "Vacinas",
                onPressed: () {
                  Navigator.pop(context, false);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RelatorioEditVacinas(),
                      ));
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(
                    Icons.medication, color: Color.fromRGBO(35, 100, 128, 1)
                ),
                tooltip: "Remédios",
                onPressed: () {
                  Navigator.pop(context, false);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RelatorioEditRemedios(),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
