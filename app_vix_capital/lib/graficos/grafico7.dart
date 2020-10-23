import 'package:app_vix_capital/models/rendimentoModel.dart';
import 'package:charter/charter.dart';
import 'package:flutter/material.dart';

class Grafico7page extends StatefulWidget {
  final int idInvestimento;

  const Grafico7page({this.idInvestimento});

  @override
  _Grafico7pageState createState() => _Grafico7pageState(idInvestimento);
}

class _Grafico7pageState extends State<Grafico7page> {
  final int idInvestimento;
  _Grafico7pageState(this.idInvestimento);

  var grid = [5, 10, 15, 20];
  var data = [10, 7, 17, 15];

  //List<String> feature;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("Grafico7-idInvestimento: $idInvestimento");

    var teste = new RendimentoModel().getRendimentosCliente(idInvestimento);
    print(teste);

/*
    FutureBuilder(
      future: new RendimentoModel().getRendimentosCliente(idInvestimento),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        print("builder");
        return listViewBuilder(
            context, snapshot.data); //ajustar strigns e ver o erro
      },
    );
*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: PolarAreaChart.basic(
        grid: grid, // [5, 10, 15, 20], // Scale for the whole chart

        features: [
          "Capital\nR\$10.000,00",
          "Rendimento\nR\$7.000,00",
          "Total\nR\$17.000,00",
          "À Receber\nR\$15.000,00",
        ],

        data: [10, 7, 17, 15], //, 2, 9, 13, 5, 6, 10],
        featuresTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        drawSegmentDividers: true,
        featureColors: [
          Colors.blue,
          Colors.red,
          Colors.orange,
          Colors.green,
          /*Colors.yellow,
            Colors.pink,
          Colors.brown,
          Colors.amber,
          Colors.red[600]*/
        ],
      ),
    );
  }

  Widget listViewBuilder(BuildContext context, List<dynamic> values) {
    if (values == null) {
      return Container(
        color: Colors.red,
        height: 30,
        width: 30,
        child: Text("NULL-Values $values"),
      );
    } else {
      return Container(
        color: Colors.green,
        height: 30,
        width: 30,
        child: Text("Values $values"),
      );
    }
  }
}
