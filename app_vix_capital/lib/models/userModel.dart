import 'dart:convert';

import 'package:app_vix_capital/models/cliente.dart';
import 'package:app_vix_capital/models/investimentoData.dart';
import 'package:app_vix_capital/models/rendimentoData.dart';
import 'package:app_vix_capital/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class UserModel extends Model {
  bool isLoading = false;
  Usuario userData;
  Cliente cliente;

  void esqueciMinhaSenha(
      {@required String email,
      @required VoidCallback onSuccessEsqSenha,
      @required VoidCallback onFailEsqSenha}) async {
    loadNotifal(true);
    String resultado = "";
    try {
      http.Response response;
      response = await http.get(
          "http://capitalvix1.hospedagemdesites.ws/api/esqueciminhasenha.aspx?email=$email");

      print("${response.statusCode}");
      print("esqueciMinhaSenha-resultado: ${response.body}");

      if (response != null) {
        resultado = response.body.toString();
        if (resultado.compareTo('sucesso') == 0) {
          loadNotifal(false);
          onSuccessEsqSenha();
        } else {
          loadNotifal(false);
          onFailEsqSenha();
        }
      }
      //return resultado;
    } catch (ex) {
      loadNotifal(false);
      onFailEsqSenha();
      //return resultado;
    }
  }

  void singUp(
      {@required Map<String, dynamic> userData,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    loadNotifal(true);

    try {
      //inserção dos dados no banco atraves do webservice

      var url =
          "http://capitalvix1.hospedagemdesites.ws/api/cadastrocliente.aspx";
      //var url = "https://localhost:44397/api/usuarioset.aspx";

      //encode Map to JSON
      var body = json.encode(userData);
      print("body: $body");

      http.Response response;
      response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);

      //print("return setClienteData:");
      //print("${response.statusCode}");
      print("resultado: ${response.body}");
      //print(response.body.toString().compareTo('sucesso'));

      if (response.body.toString().compareTo('sucesso') == 0) {
        onSuccess();
      } else {
        onFail();
      }

      loadNotifal(false);
    } catch (ex) {
      onFail();
      loadNotifal(false);
    }
  }

  void singIn(
      {@required String email,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    loadNotifal(true);

    //verificação do Login/senha pelo webservice aki;
    String _login = email;
    String _senha = pass;

    try {
      http.Response response;
      response = await http.get(
          "http://capitalvix1.hospedagemdesites.ws/api/usuariologin.aspx?login=$_login&senha=$_senha");

      if (response != null) {
        var usuarioJson = json.decode(response.body);
        userData = new Usuario.fromJson(usuarioJson);
        if (userData.Id > 0) {
          var idCliente = userData.Id;
          response = await http.get(
              "http://capitalvix1.hospedagemdesites.ws/api/usuarioget.aspx?id=$idCliente");
          if (response != null) {
            var clienteJson = json.decode(response.body);
            cliente = new Cliente.fromJson(clienteJson);
          }

/*
          response = await http.get(
              "http://capitalvix1.hospedagemdesites.ws/api/listainvestimentocliente.aspx?id=$idCliente");

          //print("response.body: ${response.body}");

          if (response != null) {
            var listJson = json.decode(response.body) as List;

            print("listaJson: $listJson");

            //erro na converão para lista
            listaInvest =
                listJson.map((e) => InvestimentoData.fromJson(e)).toList();

            print("Qtde Investimento: ${listaInvest.length}");
            */

/*
            
            var listRdtoJson = json.decode(response.body);
            print("listRdtoJson: $listRdtoJson");
            var listaRendtos = listRdtoJson['ListaRendtos'];
            print(listaRendtos);
*/
          //print("qtde investimentos ${cliente.Nome}: ${listaInvest.length}");

/*
            for (int i = 0; i < listaInvest.length; i++) {
              print("=========== BEGIN = ${i++} ============");
              print("ID:${listaInvest[i].Id} - valor: ${listaInvest[i].Valor}");

              print("Qtde Rendimentos: ${listaInvest[i].ListaRendto}");

              //for (var x = 0; x < listaInvest[i].ListaRendto.length; x++) {
              //  print(
              //      "Rendimento: ${listaInvest[i].ListaRendto[x].CapitalMaisRendimento} \n");
              // }
              //      print("Qtde itens lista: ${lista.length}");

              //

              print("=========== END =============\n");
            }
*/
          //print("ID:${listaInvest[0].Id} - valor: ${listaInvest[0].Valor}");

          // }//End if (response != null)

          onSuccess();
        } else {
          userData = null;
          onFail();
        }
        //await Future.delayed(Duration(seconds: 3));
      }
      loadNotifal(false);
    } catch (ex) {
      onFail();
      loadNotifal(false);
    }
  }

  Future<Cliente> getDadosCliente(int idCliente) async {
    //print("passei getDadosCliente - id: $idCliente");
    loadNotifal(true);

    http.Response response;
    response = await http.get(
        "http://capitalvix1.hospedagemdesites.ws/api/usuarioget.aspx?id=$idCliente");

    if (response != null) {
      var clienteJson = json.decode(response.body);
      print(response.body);
      cliente = new Cliente.fromJson(clienteJson);

      print("Cliente: ${cliente.Nome}");
      return cliente;
    }
    loadNotifal(false);
    return new Cliente();
  }

  void atualizaDadosCliente() {
    cliente = getDadosCliente(returnoIdCliente()) as Cliente;
  }

  Future<List<InvestimentoData>> getInvestimentosCliente() async {
    int idCliente = returnoIdCliente();

    //print("getInvestimentosCliente  - id: $idCliente");

    //loadNotifal(true);
    http.Response response;
    response = await http.get(
        "http://capitalvix1.hospedagemdesites.ws/api/listainvestimentocliente.aspx?id=$idCliente");

    //print("response: ${response.body}");

    if (response != null) {
      var listJson = json.decode(response.body) as List;

      List<InvestimentoData> lista =
          listJson.map((e) => InvestimentoData.fromJson(e)).toList();

/*
      print("lista.length: ${lista.length}");
      for (int i = 0; i < lista.length; i++) {
        print("valor: ${lista[i].Valor}");
      }
      */

      //loadNotifal(false);

      return lista;
    }

    loadNotifal(false);
    return null;
  }

  int returnoIdCliente() {
    return userData.Id;
  }

  void recoverPass() {}

  void singOut() async {
    //print("chequei aki singOut");
    userData = null;
    notifyListeners();
  }

  void loadNotifal(bool value) {
    isLoading = value;
    notifyListeners();
  }

  bool isUserLogado() {
    return userData != null;
  }

  // ignore: missing_return
  void setClienteData(
      {@required Map<String, dynamic> clienteData,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    String resultado = "";

    loadNotifal(true);

    var url = "http://capitalvix1.hospedagemdesites.ws/api/usuarioset.aspx";
    //encode Map to JSON
    var body = json.encode(clienteData);

    //print("setClienteData-body: $body");

    http.Response response;
    response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    //print("statusCode: ${response.statusCode}");
    //print("resultado: ${response.body}");

    if (response != null) {
      resultado = "${response.body}";
      if (resultado.compareTo('sucesso') == 0) {
        onSuccess();
      } else {
        onFail();
      }
      loadNotifal(false);
    } else {
      onFail();
    }

    loadNotifal(false);
    //return resultado;
  }

  Future<List<RendimentoData>> getRendimentosCliente(int idInvestimento) async {
    //print("getInvestimentosCliente  - id: $idCliente");

    //loadNotifal(true);

    http.Response response;
    response = await http.get(
        "http://capitalvix1.hospedagemdesites.ws/api/listaredimentocliente.aspx?id=$idInvestimento");

    //print("response: ${response.body}");

    if (response != null) {
      var listJson = json.decode(response.body) as List;

      List<RendimentoData> lista =
          listJson.map((e) => RendimentoData.fromJson(e)).toList();

/*
      print("lista.length: ${lista.length}");
      for (int i = 0; i < lista.length; i++) {
        print("valor: ${lista[i].Valor}");
      }
      */

      //loadNotifal(false);

      return lista;
    }

    return null;
  }
}
