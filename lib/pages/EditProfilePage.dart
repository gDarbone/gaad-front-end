import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/CategoryListPage.dart';
import 'package:gaad_mobile/pages/welcomepage.dart';

import '../widgets/mainappbar.dart';
import '../widgets/sidemenubar.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SideMenuBar(),
      ),
      appBar: MainAppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Editar Perfil",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.blueAccent,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              buildTextField("Nome", "Gabriel Darbone", false, false),
              buildTextField("Data de Nascimento", "13/08/1996", false, false),
              buildTextField("Gênero", "Masculino", false, false),
              buildTextField("Email", "teste@teste.com", false, true),
              buildTextField("Senha", "*********", true, true),
              buildTextField("Endereço", "Rua xxxxxxxxxx", false, true),
              buildTextField("Número", "1234", false, true),
              buildTextField("Bairro", "Bairro x", false, true),
              buildTextField("Telefone", "1199999999", false, true),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor:
                          Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                      highlightColor:
                          Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Salvo com Sucesso."),
                          content: Text(
                              "Suas alterações foram salvas com sucesso, você será redirecionado para a tela principal."),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CategoryListPage(),
                                      ),
                                    ),
                                child: Text("Ok"))
                          ],
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 57.0),
                        child: Text(
                          'Salvar',
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
