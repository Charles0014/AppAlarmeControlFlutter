import 'package:flutter/material.dart';
import 'package:flutterappcontrolealarme/pages/home.dart';
import 'package:flutterappcontrolealarme/pages/painel.dart';

void main() {
  runApp(MaterialApp(
    title: 'Alarme Controle',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarme',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            )),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[Colors.white, Colors.lightBlueAccent])),
                child: Container(
                    child: Column(
                  children: [
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Image.asset(
                        'images/logo.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Central Alarmes',
                        style: TextStyle(color: Colors.black54, fontSize: 16.0),
                      ),
                    )
                  ],
                ))),
            CustomListTile(
                Icons.home,
                'Home',
                () => {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Home()))
                    }),
            CustomListTile(
                Icons.dialpad,
                'Painel',
                () => {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Painel()))
                    }),
            CustomListTile(Icons.notifications, 'Notificações', () => {}),
            CustomListTile(Icons.settings, 'Configuração', () => {}),
            CustomListTile(Icons.info, 'informações', () => {}),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
          child: InkWell(
            splashColor: Colors.lightBlueAccent,
            onTap: onTap,
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        icon,
                        color: Colors.blue,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          text,
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_right),
                ],
              ),
            ),
          ),
        ));
  }
}
