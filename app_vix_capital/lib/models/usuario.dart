class Usuario {
  int Id;
  int IdStatus;
  String Nome;
  String SobreNome;
  String Rg;
  String Cpf;

  Usuario(
      {this.Id, this.IdStatus, this.Nome, this.SobreNome, this.Rg, this.Cpf});

  factory Usuario.fromJson(Map<String, dynamic> parsedJson) {
    return Usuario(
        Id: parsedJson["Id"],
        IdStatus: parsedJson["IdStatus"],
        Nome: parsedJson["Nome"],
        SobreNome: parsedJson["SobreNome"],
        Rg: parsedJson["Rg"],
        Cpf: parsedJson["Cpf"]);
  }
}
