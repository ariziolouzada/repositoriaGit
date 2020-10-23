import 'package:app_vix_capital/models/rendimentoData.dart';
import 'package:flutter/material.dart';

class RendimentoTitle extends StatelessWidget {
  //final String valor;
  //final String data;
  //const RendimentoTitle({this.valor = "", this.data = ""});
  final RendimentoData rendimentoData;

  RendimentoTitle({this.rendimentoData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 100.0,
        //decoration: BoxDecoration(
        //color: Colors.white.withOpacity(0.9),
        //borderRadius: BorderRadius.circular(10),
        //    ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/images/graficoPizza02.jpg"),
          ),
          title: Text(
            "R\$ ${rendimentoData.CapitalMaisRendimentoStr}",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20.0,
            ),
          ),
          subtitle: Text(
              "Em: ${rendimentoData.DataStr}\nValor: ${rendimentoData.ValorStr}"),
/*
          title: Text(
            valor,
            style: TextStyle(color: Colors.red, fontSize: 20.0),
          ),
          subtitle: Text(data),
          */
        ),
      ),
    );
  }
}
