import 'package:app_vix_capital/graficos/grafico.dart';
import 'package:app_vix_capital/graficos/grafico1.dart';
import 'package:app_vix_capital/graficos/grafico2.dart';
import 'package:app_vix_capital/graficos/grafico3.dart';
import 'package:app_vix_capital/graficos/grafico4.dart';
import 'package:app_vix_capital/graficos/grafico5.dart';
import 'package:app_vix_capital/graficos/grafico7.dart';
import 'package:app_vix_capital/models/rendimentoData.dart';
import 'package:app_vix_capital/models/rendimentoModel.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class RendimentoGraficos extends StatefulWidget {
  final int idInvestimento;

  const RendimentoGraficos({this.idInvestimento});

  @override
  _RendimentoGraficoState createState() =>
      _RendimentoGraficoState(idInvestimento);
}

class _RendimentoGraficoState extends State<RendimentoGraficos> {
  final int idInvestimento;
  PageController controller;

  GlobalKey<PageContainerState> key = GlobalKey();

  _RendimentoGraficoState(this.idInvestimento);

  RendimentoData rd;

  @override
  void initState() {
    super.initState();
    controller = PageController();

    print("idInvestimento: $idInvestimento");

/*
    FutureBuilder(
        future: new RendimentoModel().getRendimentosCliente(idInvestimento),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //return listViewBuilder(context, snapshot.data);
          //ajustar strigns e ver o erro
          print("RendimentoData: ${snapshot.data}");
        });
*/
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pink,
        child: Container(
          //height: 40.0,
          child: PageIndicatorContainer(
            key: key,
            child: PageView(
              children: <Widget>[
                Grafico7page(
                  idInvestimento: idInvestimento,
                ),
                Grafico(),
                Grafico4Page()
                //Grafico1PageWidget(),
                //Grafico2Page(),
                //Grafico3Page(),
                //Grafico5Page()
              ],
              controller: controller,
              reverse: true,
            ),
            align: IndicatorAlign.bottom,
            length: 3,
            indicatorSpace: 10.0,
          ),
        ),
      ),
/*
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        tooltip: "Forçar indicador de atualização",
        onPressed: () {
          key.currentState.forceRefreshState();
        },
      ),
      */
    );
  }
}
