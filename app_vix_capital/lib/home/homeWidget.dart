import 'package:app_vix_capital/home/drawerCustom.dart';
import 'package:app_vix_capital/login/pages/loginPageWidget.dart';
import 'package:app_vix_capital/models/userModel.dart';
import 'package:app_vix_capital/tabs/investimentoTab.dart';
import 'package:app_vix_capital/tabs/meusDadosTab.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  //final _pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    print("index: $index");
    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeWidget(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MeusDadosTab(),
        ),
      );
    }
  }

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
          ScopedModelDescendant<UserModel>(builder: (context, child, model) {
            return Scaffold(
              backgroundColor: Colors.white.withOpacity(0.9),
              drawer: CustomDrawer(),
              appBar: AppBar(
                title: Text(
                  "Investimentos",
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.power_settings_new,
                      color: Colors.white,
                    ),
                    //tooltip: "Sair",
                    onPressed: () {
                      model.loadNotifal(false);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPageWidget(),
                        ),
                      );
                    },
                  ),
                  //Text("Sair"),
                ],
              ),
              body: InvestimentoTab(),
              /*            
              ListView(
                children: [

                InvestimentoTitle(
                  valor: "R\$ 20.000,00",
                  data: "12/09/2020",
                ),
                InvestimentoTitle(
                  valor: "R\$ 10.000,00",
                  data: "05/09/2020",
                ),
              
                ],
              ),
  */

              //colocar link nos Icons para mudança de página

              bottomNavigationBar: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.monetization_on),
                      title: Text("Investimentos")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle),
                      title: Text("Meus Dados")),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Theme.of(context).accentColor,
                onTap: _onItemTapped,
              ),
            );
          }),
        ],
      ),
    );
  }
}
