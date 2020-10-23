class InvestimentoData {
  int Id;
  int IdCliente;
  int IdStatus;
  int Prazo;
  String ValorStr;
  double PorcentagemRetorno;
  String DataInicioStr;
  String DataTerminoStr;
  String Status;

  String ValorRendimentoStr;
  String PorcentagemRendimentoStr;
  String DataRendimentoStr;
  String SomaRendimentoStr;

  InvestimentoData({
    this.Id,
    this.IdCliente,
    this.IdStatus,
    this.Prazo,
    this.ValorStr,
    this.PorcentagemRetorno,
    this.DataInicioStr,
    this.DataTerminoStr,
    this.Status,
    this.ValorRendimentoStr,
    this.PorcentagemRendimentoStr,
    this.DataRendimentoStr,
    this.SomaRendimentoStr,
  });

  factory InvestimentoData.fromJson(Map<String, dynamic> parsedJson) {
    var investimentoData = InvestimentoData(
        Id: parsedJson["Id"],
        IdCliente: parsedJson["IdCliente"],
        IdStatus: parsedJson["IdStatus"],
        Prazo: parsedJson["Prazo"],
        ValorStr: parsedJson["ValorStr"],
        PorcentagemRetorno: parsedJson["PorcentagemRetorno"],
        DataInicioStr: parsedJson["DataInicioStr"],
        DataTerminoStr: parsedJson["DataTerminoStr"],
        Status: parsedJson["Status"],
        ValorRendimentoStr: parsedJson["ValorRendimentoStr"],
        PorcentagemRendimentoStr: parsedJson["PorcentagemRendimentoStr"],
        DataRendimentoStr: parsedJson["DataRendimentoStr"],
        SomaRendimentoStr: parsedJson["SomaRendimentoStr"]);

    //var invest = investimentoData;

    //var listJson = json.decode(parsedJson["ListaRendtos"]) as List;
    //invest.listaRdto = parsedJson["ListaRendtos"];
    //     listJson.map((e) => RendimentoData.fromJson(e)).toList();

    return investimentoData;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.Id;
    data['IdCliente'] = this.IdCliente;
    data['IdStatus'] = this.IdStatus;
    data['Prazo'] = this.Prazo;
    data['Valor'] = this.ValorStr;
    data['PorcentagemRetorno'] = this.PorcentagemRetorno;
    data['DataInicio'] = this.DataInicioStr;
    //data['Status'] = this.status;
    return data;
  }
}
