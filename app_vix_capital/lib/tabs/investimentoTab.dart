import 'package:app_vix_capital/login/pages/loginPageWidget.dart';
import 'package:app_vix_capital/models/userModel.dart';
import 'package:app_vix_capital/title/investimentoTitle.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class InvestimentoTab extends StatelessWidget {
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.9),
      padding: EdgeInsets.all(5.0),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading && model.isUserLogado()) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!model.isUserLogado()) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 80.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Faça o login para acessar seu(s) investimento(s).",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Colors.grey[500],
                        ),
                      ),
                      child: Text(
                        "Entrar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPageWidget()));
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            //carregar os investimentos

            /*
            var idCliente = model.getInvestimentosCliente();
            //print("ID: $idCliente");

            return Container(
              child: Text("ID: $idCliente"),
            );
*/
            return Scaffold(
              //backgroundColor: Colors.white.withOpacity(0.9),
              key: _scaffoldkey,
              body: FutureBuilder(
                future: model.getInvestimentosCliente(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return listViewBuilder(context, snapshot.data);
                },
              ),

              /*  
  
              ScopedModelDescendant<UserModel>(
                  builder: (context, child, model) {
                var listaInvest = model.listaInvest;
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: listaInvest.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InvestimentoTile(listaInvest[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                );
              }),
*/
            );
          }
        },
      ),
    );
  }

  Widget listViewBuilder(BuildContext context, List<dynamic> values) {
    if (values == null) {
      return ListView();
    } else {
      return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: values.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          //print("index: $index");
          return InvestimentoTitle(values[index]);

          /*
        return ListTile(
          //leading: Text((values[index].Id).toString()),
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/img/imgInvestimento05.jpeg"),
          ),
          title: Text((values[index].ValorStr).toString()),
          subtitle: Text((values[index].DataInicioStr).toString()),
        );
*/
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
    }
/*
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          //leading: Text((values[index].Id).toString()),
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/img/imgInvestimento05.jpeg"),
          ),
          title: Text((values[index].ValorStr).toString()),
          subtitle: Text((values[index].DataInicioStr).toString()),
        );
      },
    );
    */
  }
}
