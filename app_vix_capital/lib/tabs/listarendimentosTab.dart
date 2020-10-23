import 'package:app_vix_capital/models/rendimentoModel.dart';
import 'package:flutter/material.dart';

class ListaRendimentoTab extends StatelessWidget {
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  final int idInvestimento;

  ListaRendimentoTab({this.idInvestimento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("Lista de Rendimentos"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder(
        future: new RendimentoModel().getRendimentosCliente(idInvestimento),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return listViewBuilder(context, snapshot.data);
          //ajustar strigns e ver o erro
        },
      ),

/*
            Container(
          alignment: Alignment.center,
          child: ListView(
            children: [
              //teste abixo pra ver se est� aparecendo correto
              ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      AssetImage("assets/img/imgInvestimento04.jpeg"),
                ),
                title: Text("R\$ 10.000,00"),
                subtitle: Text("Em: 31/08/2020"),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        )
*/

      //}
      //}),
    );
  }

  Widget listViewBuilder(BuildContext context, List<dynamic> values) {
    if (values == null) {
      return ListView();
    } else {
      return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          //return RendimentoTitle(values[index]);
          /*
        return ListTile(
          //leading: Text((values[index].Id).toString()),
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/img/imgInvestimento04.jpeg"),
          ),
          title: Text((values[index].CapitalMaisRendimento).toString()),
          subtitle: Text((values[index].Data).toString()),
        );
*/

          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("assets/images/graficoPizza02.jpg"),
            ),
            title: Text(
              (values[index].CapitalMaisRendimentoStr).toString(),
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (values[index].DataStr).toString(),
                ),
                Text(
                  "${values[index].PorcentagemStr}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${values[index].ValorStr}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );

      /*
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Text((values[index].Id).toString()),
          title: Text((values[index].CapitalMaisRendimento).toString()),
          subtitle: Text((values[index].Data).toString()),
        );
      },
    );
*/
    }
  }
}
