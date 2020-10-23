import 'dart:convert';
import 'package:app_vix_capital/models/rendimentoData.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class RendimentoModel extends Model {
  List<RendimentoData> lista = List();
  bool isLoading = false;

  Future<List<RendimentoData>> getRendimentosCliente(int idInvestimento) async {
    //loadNotifal(true);

    http.Response response;
    response = await http.get(
        "http://capitalvix1.hospedagemdesites.ws/api/listaredimentocliente.aspx?id=$idInvestimento");

    //print("response: ${response.body}");

    if (response != null) {
      var listJson = json.decode(response.body) as List;

      //print(listJson);

      List<RendimentoData> lista =
          listJson.map((e) => RendimentoData.fromJson(e)).toList();

      //print(listJson);
/*
      print("lista.length: ${lista.length}");
      for (int i = 0; i < lista.length; i++) {
        print("valor: ${lista[i].Valor}");
      }
      */

      //loadNotifal(false);
      //print(lista[0].DataStr);

      return lista;
    }

    return null;
  }

  void loadNotifal(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
