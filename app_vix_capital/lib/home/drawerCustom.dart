import 'package:app_vix_capital/home/drawerTile.dart';
import 'package:app_vix_capital/home/homeWidget.dart';
import 'package:app_vix_capital/login/pages/loginPageWidget.dart';
import 'package:app_vix_capital/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {
  /*
  final PageController pageController;
  CustomDrawer(this.pageController);
*/

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Image.asset(
                        "assets/logos/nomeCapitalVix.png",
                        width: 250,
                        height: 80,
                      ),
/*
                      Text(
                        "Vix Capital",
                        style: TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      */
                    ),
                    Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Olá, ${!model.isUserLogado() ? "" : model.userData.Nome}",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                                GestureDetector(
                                  child: Text(
                                    !model.isUserLogado()
                                        ? "Entre ou cadastre-se,"
                                        : "",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () {
                                    if (!model.isUserLogado())
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPageWidget()));
                                    else
                                      model.singOut();
                                  },
                                )
                              ],
                            );
                          },
                        ))
                  ],
                ),
              ),
              Divider(),
              //DrawerTitle(Icons.home, "Início", 0),
              DrawerTitle(Icons.monetization_on, "Investimentos", 1),
              DrawerTitle(Icons.account_circle, "Meus Dados", 2),
              DrawerTitle(Icons.power_settings_new, "Sair", 3),
            ],
          )
        ],
      ),
    );
  }
}
