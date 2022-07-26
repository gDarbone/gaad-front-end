import 'package:flutter/material.dart';

class PermissionPage extends StatefulWidget {
  @override
  _PermissionPage createState() => _PermissionPage();
}

class _PermissionPage extends State<PermissionPage> {
  bool _StartApp = false;
  bool _ShowNotif = false;

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
        child: ListView(
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.white,
                child: SwitchListTile(
                  title: Text(
                    'Inicialização Automática',
                    style: TextStyle(
                        color: Color.fromRGBO(35, 100, 128, 1),
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                  value: _StartApp,
                  activeColor: Color.fromRGBO(35, 100, 128, 1),
                  inactiveTrackColor: Colors.grey,
                  onChanged: (bool value) {
                    setState(() {
                      _StartApp = value;
                    });
                  },
                  subtitle: Text(
                    'Icicia o Aplicativo ao reiniciar o Aparelho',
                    style: TextStyle(
                      color: Colors.blueGrey[600],
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
            Container(
              child: Card(
                color: Colors.white,
                child: SwitchListTile(
                  title: Text(
                    'Token Permanente',
                    style: TextStyle(
                        color: Color.fromRGBO(35, 100, 128, 1),
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                  value: _ShowNotif,
                  activeColor: Color.fromRGBO(35, 100, 128, 1),
                  inactiveTrackColor: Colors.grey,
                  onChanged: (bool value) {
                    setState(() {
                      _ShowNotif = value;
                    });
                  },
                  subtitle: Text(
                    'Sempre exibir o Token na barra de notificações para identificação em caso de acidentes',
                    style: TextStyle(
                      color: Colors.blueGrey[600],
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
