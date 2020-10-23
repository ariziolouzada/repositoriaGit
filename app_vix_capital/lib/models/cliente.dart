class Cliente {
  int Id;
  //int IdStatus;
  String Nome;
  String SobreNome;
  String Rg;
  String Cpf;
  String Email;
  String Telefone;
  String EndLogradouro;
  String EndNumero;
  String EndComplemento;
  String EndCidade;
  String EndBairro;
  String EndUf;
  String EndCep;
  String Nacionalidade;
  String EstadoCivil;

  Cliente(
      {this.Id,
      this.Nome,
      this.SobreNome,
      this.Rg,
      this.Cpf,
      this.EndLogradouro,
      this.EndNumero,
      this.EndComplemento,
      this.EndBairro,
      this.EndCidade,
      this.EndUf,
      this.EndCep,
      this.EstadoCivil,
      this.Nacionalidade,
      this.Email,
      this.Telefone});

  factory Cliente.fromJson(Map<String, dynamic> parsedJson) {
    return Cliente(
        Id: parsedJson["Id"],
        //IdStatus: parsedJson["IdStatus"],
        Nome: parsedJson["Nome"],
        SobreNome: parsedJson["SobreNome"],
        Rg: parsedJson["Rg"],
        Cpf: parsedJson["Cpf"],
        EndLogradouro: parsedJson["EndLogradouro"],
        EndNumero: parsedJson["EndNumero"],
        EndComplemento: parsedJson["EndComplemento"],
        EndBairro: parsedJson["EndBairro"],
        EndCidade: parsedJson["EndCidade"],
        EndUf: parsedJson["EndUf"],
        EndCep: parsedJson["EndCep"],
        EstadoCivil: parsedJson["EstadoCivil"],
        Nacionalidade: parsedJson["Nacionalidade"],
        Email: parsedJson["Email"],
        Telefone: parsedJson["Telefone"]);
  }

  ///{"Id":2,"IdNacionalidade":0,"IdEstadoCivil":0,"IdStatus":2,
  ///"Nome":"ARIZIO","SobreNome":"AGUILAR OLIVEIRA LOUZADA","Rg":"178091-PMES",
  ///"Cpf":"02033586782","EndLogradouro":"Rua da Palmeiras","EndNumero":"220",
  ///"EndComplemento":"","EndBairro":"Itarare","EndCidade":"vitória",
  ///"EndUf":"ES","EndCep":"29047550","Telefone":"027 999330097",
  ///"Email":"ariziolouzada@gmail.com","DataCadastro":"2020-03-19T13:06:54",
  ///"HashResetSenha":"","DataHashResetSenha":"0001-01-01T00:00:00",
  ///"Status":"ATIVO"}
}
