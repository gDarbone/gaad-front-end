import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';


class RelatorioRemediosCard extends StatefulWidget {
  @override
  _RelatorioRemediosCard createState() => _RelatorioRemediosCard();
}

class _RelatorioRemediosCard extends State<RelatorioRemediosCard> {

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "REMÉDIO",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 30,
              ),
              buildTextField("Nome:", "Rivotril", false, false),
              buildTextField("Data de Inicio da Dosagem:", "11/09/2000", false, false),
              buildTextField("Categoria:", "Depressão", false, false),
              buildTextField("Observação/Descrição:", "Tomar Diariamente", false, false),
              SizedBox(
                height: 15,
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, bool isEnabled) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            enabled: isEnabled,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
