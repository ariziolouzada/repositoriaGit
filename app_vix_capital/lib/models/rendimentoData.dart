class RendimentoData {
  int Id;
  int IdInvestimento;
  String ValorStr;
  String CapitalMaisRendimentoStr;
  String DataStr;
  String PorcentagemStr;

  RendimentoData(
      {this.Id,
      this.IdInvestimento,
      this.ValorStr,
      this.CapitalMaisRendimentoStr,
      this.DataStr,
      this.PorcentagemStr});

  factory RendimentoData.fromJson(Map<String, dynamic> parsedJson) {
    return RendimentoData(
        Id: parsedJson['Id'],
        IdInvestimento: parsedJson['IdInvestimento'],
        ValorStr: parsedJson['ValorStr'],
        CapitalMaisRendimentoStr: parsedJson['CapitalMaisRendimentoStr'],
        DataStr: parsedJson['DataStr'],
        PorcentagemStr: parsedJson['PorcentagemStr']);
  }

/*

  Map<String, dynamic> toMap() {
    return {
      'Id': Id,
      'IdInvestimento': IdInvestimento,
      'Valor': Valor,
      'CapitalMaisRendimento': CapitalMaisRendimento,
      'Data': Data
    };
  }

  factory RendimentoData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RendimentoData(
        Id: map['Id'],
        IdInvestimento: map['IdInvestimento'],
        Valor: map['Valor'],
        CapitalMaisRendimento: map['CapitalMaisRendimento'],
        Data: map['Data']);
  }

  String toJson() => json.encode(toMap());

  factory RendimentoData.fromJson(String source) =>
      RendimentoData.fromMap(json.decode(source));
*/

}
