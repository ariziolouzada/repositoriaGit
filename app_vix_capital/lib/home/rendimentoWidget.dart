import 'package:flutter/material.dart';

class RendimentoWidget extends StatefulWidget {
  @override
  _RendimentoWidgetState createState() => _RendimentoWidgetState();
}

class _RendimentoWidgetState extends State<RendimentoWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/grafico03.jpg",
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.white.withOpacity(0.9),
            appBar: AppBar(
              title: Text(
                "Rendimentos",
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.open_in_new,
                    color: Colors.white,
                  ),
                  tooltip: "Sair",
                  onPressed: () {},
                ),
              ],
            ),
            body: ListView(
              children: [],
            ),
            bottomNavigationBar:
                BottomNavigationBar(items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.monetization_on),
                  title: Text("Investimentos")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), title: Text("Meus Dados")),
            ]),
          ),
        ],
      ),
    );
  }
}
