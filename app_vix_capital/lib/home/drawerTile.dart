import 'package:app_vix_capital/home/homeWidget.dart';
import 'package:app_vix_capital/login/pages/loginPageWidget.dart';
import 'package:app_vix_capital/models/userModel.dart';
import 'package:app_vix_capital/tabs/meusDadosTab.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DrawerTitle extends StatelessWidget {
  final IconData icon;
  final String text;
  //final PageController controller;
  final int page;

  Color corDrawer1 = Color.fromRGBO(27, 61, 114, 1.0);
  Color corDrawer2 = Color.fromRGBO(27, 61, 114, 1.0);
  Color corDrawer3 = Color.fromRGBO(27, 61, 114, 1.0);

  //

  DrawerTitle(this.icon, this.text, this.page);

  void redirectPage(int pagina, BuildContext context) {
    switch (pagina) {
      case 1: //Investimentos
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeWidget(),
          ),
        );
        corDrawer1 = Color(0xFF1B3D72);
        corDrawer2 = corDrawer3 = Color.fromRGBO(27, 61, 114, 1.0);
        break;
      case 2: //meus dados
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MeusDadosTab(),
          ),
        );
        corDrawer2 = Color(0xFF1B3D72);
        corDrawer1 = corDrawer3 = Color.fromRGBO(27, 61, 114, 1.0);
        break;
      case 3: //sair
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LoginPageWidget(),
          ),
        );
        corDrawer3 = Color(0xFF1B3D72);
        corDrawer2 = corDrawer1 = Color.fromRGBO(27, 61, 114, 1.0);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          return InkWell(
            onTap: () {
              print("Clicou pagina: $page");
              if (page == 3) {
                model.loadNotifal(false);
              }
              redirectPage(page, context);
              /*
          Navigator.of(context).pop();
          controller.jumpToPage(page);
          */
            },
            child: Container(
              height: 60.0,
              child: Row(
                children: <Widget>[
                  Icon(
                    icon,
                    size: 32.0,
                    color: page == 1
                        ? corDrawer1
                        : page == 2 ? corDrawer2 : corDrawer3,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: page == 1
                          ? corDrawer1
                          : page == 2 ? corDrawer2 : corDrawer3,
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
