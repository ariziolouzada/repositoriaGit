import 'package:app_vix_capital/graficos/grafico.dart';
import 'package:app_vix_capital/graficos/verticalBarLabelChart.dart';
import 'package:app_vix_capital/models/investimentoData.dart';
import 'package:app_vix_capital/tabs/listarendimentosTab.dart';
import 'package:app_vix_capital/tabs/rendimentoTab.dart';
import 'package:flutter/material.dart';

class InvestimentoTitle extends StatelessWidget {
  final InvestimentoData investimentoData;
  InvestimentoTitle(this.investimentoData);

/*
  final String valor;
  final String data;
  const InvestimentoTitle({this.valor = "", this.data = ""});
*/

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage("assets/images/graficoPizza01.jpg"),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${investimentoData.ValorStr}",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${investimentoData.Status}",
              style: TextStyle(
                color: Colors.green,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rendimento em ${investimentoData.DataRendimentoStr}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "${investimentoData.SomaRendimentoStr}",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${investimentoData.PorcentagemRendimentoStr} do capital inicial.",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "Prazo: ${investimentoData.Prazo} meses.",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "Término contrato em ${investimentoData.DataTerminoStr}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 11.0,
                      ),
                    ),

                    /*
                Text(
                  "Início: ${investimentoData.DataInicioStr}\nTérmino: ${investimentoData.DataTerminoStr}",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 10.0,
                  ),
                ),
                */
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.monetization_on),
                      tooltip: 'Lista dos rendimentos.',
                      color: Colors.green,
                      iconSize: 50,
                      onPressed: () {
                        int idInvestimento = investimentoData.Id;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ListaRendimentoTab(
                              idInvestimento: idInvestimento,
                            ),
                          ),
                        );
                      },
                    ),
                    Text(
                      "Rendimentos",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
            child: Column(
              children: [
                Text(
                  "Últimos rendimentos",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 300,
                  child:
                      //Grafico(),
                      VerticalBarLabelChart(),
                ),
              ],
            ),

            /*
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.insert_chart),
                      tooltip: 'Gráfico dos rendimentos.',
                      color: Colors.blue,
                      iconSize: 50,
                      onPressed: () {
                        int idInvestimento = investimentoData.Id;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RendimentoTab(
                              idInvestimento: idInvestimento,
                            ),
                          ),
                        );
                      },
                    ),
                    Text(
                      "Gráfico",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.monetization_on),
                      tooltip: 'Lista dos rendimentos.',
                      color: Colors.green,
                      iconSize: 50,
                      onPressed: () {
                        int idInvestimento = investimentoData.Id;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ListaRendimentoTab(
                              idInvestimento: idInvestimento,
                            ),
                          ),
                        );
                      },
                    ),
                    Text(
                      "Rendimentos",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),

                /*
                FlatButton(
                  onPressed: () {
                    int idInvestimento = investimentoData.Id;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RendimentoTab(
                          idInvestimento: idInvestimento,
                        ),
                      ),
                    );
                  },
                  child: Text("Gráfico"),
                  textColor: Colors.blue,
                ),
                FlatButton(
                  onPressed: () {
                    int idInvestimento = investimentoData.Id;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ListaRendimentoTab(
                          idInvestimento: idInvestimento,
                        ),
                      ),
                    );
                  },
                  child: Text("Rendimentos"),
                  textColor: Colors.red,
                ),
               
                FlatButton(
                  onPressed: () {},
                  child: Text("Detalhes"),
                  textColor: Colors.green,
                ),
                */
              ],
            ),
*/
          )
        ],

/*
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*
            Text(
              "Início: ${investimentoData.DataInicioStr}\nTérmino: ${investimentoData.DataTerminoStr}",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 10.0,
              ),
            ),
            */
            Text(
              "Término: ${investimentoData.DataTerminoStr}",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 10.0,
              ),
            ),
            Text(
              "${investimentoData.Status}",
              style: TextStyle(
                color: Colors.green,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
*/

/*
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${investimentoData.ValorRendimentoStr}",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Em: ${investimentoData.DataRendimentoStr}.",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12.0,
              ),
            ),
            /*
            Text(
              "Prazo: ${investimentoData.Prazo} meses.",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12.0,
              ),
            ),
            */
            Text(
              "Porcentagem: ${investimentoData.PorcentagemRendimentoStr}.",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
*/

        //Icon(Icons.keyboard_arrow_right),

/*
        on: () {
          //verificar ID null
          //print('ID investimento: ${investimentoData.Id}');
          int idInvestimento = investimentoData.Id;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RendimentoTab(
                idInvestimento: idInvestimento,
              ),
            ),
          );
        },
*/
      ),
    );
  }
}
