import 'package:app_vix_capital/home/drawerCustom.dart';
import 'package:app_vix_capital/home/homeWidget.dart';
import 'package:app_vix_capital/login/pages/loginPageWidget.dart';
import 'package:app_vix_capital/models/cliente.dart';
import 'package:app_vix_capital/models/userModel.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MeusDadosTab extends StatefulWidget {
  @override
  _MeusDadosState createState() => _MeusDadosState();
}

class _MeusDadosState extends State<MeusDadosTab> {
  var _nomeController = TextEditingController();
  var _sobrenomeController = TextEditingController();
  var _emailController = TextEditingController();
  var _telefoneController = TextEditingController();
  var _cpfController = TextEditingController();
  var _rgController = TextEditingController();
  var _enderecoController = TextEditingController();
  var _numeroController = TextEditingController();
  var _complementoController = TextEditingController();
  var _bairroController = TextEditingController();
  var _cidadeController = TextEditingController();
  var _ufController = TextEditingController();
  var _cepController = TextEditingController();
  //var _estadocivilController = TextEditingController();
  //var _nacionalidadeController = TextEditingController();

  final _formKey = new GlobalKey<FormState>();
  final _scaffoldkey = new GlobalKey<ScaffoldState>();

  //List<DropdownMenuItem<int>> listaItensDropNacionalidade = [];
  //List<DropdownMenuItem<int>> listaItensDropEstadoCivil = [];

  String _selectedDropNacionalidade;
  String _selectedDropEstadiCivil;

  final FocusNode _fnNome = FocusNode();
  final FocusNode _fnSobreNome = FocusNode();
  final FocusNode _fnEmail = FocusNode();
  final FocusNode _fnTel = FocusNode();
  final FocusNode _fnCpf = FocusNode();
  final FocusNode _fnRg = FocusNode();
  final FocusNode _fnNacionalidade = FocusNode();
  final FocusNode _fnEstadoCivil = FocusNode();
  final FocusNode _fnEnd = FocusNode();
  final FocusNode _fnEndNum = FocusNode();
  final FocusNode _fnEndCompl = FocusNode();
  final FocusNode _fnEndBairro = FocusNode();
  final FocusNode _fnEndCidade = FocusNode();
  final FocusNode _fnEndUf = FocusNode();
  final FocusNode _fnEndCep = FocusNode();

  /*
  void loadDropNacionalidad() {
    listaItensDropNacionalidade = [];

    listaItensDropNacionalidade.add(new DropdownMenuItem(
      child: new Text("Não Cadastrada"),
      value: 0,
    ));
  }

  void loadDropEstadoCivil() {
    listaItensDropEstadoCivil = [];

    listaItensDropEstadoCivil.add(new DropdownMenuItem(
      child: new Text("Não Cadastrado"),
      value: 0,
    ));
  }
*/
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    print("index: $index");
    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeWidget(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MeusDadosTab(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/grafico03.jpg",
            fit: BoxFit.cover,
          ),

          ScopedModelDescendant<UserModel>(
            builder: (context, child, model) {
              return Scaffold(
                backgroundColor: Colors.white.withOpacity(0.9),
                drawer: CustomDrawer(),
                key: _scaffoldkey,
                appBar: AppBar(
                  title: Text("Meus Dados"),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: Colors.white,
                      ),
                      //tooltip: "Sair",
                      onPressed: () {
                        model.loadNotifal(false);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginPageWidget(),
                          ),
                        );
                      },
                    ),
                    //Text("Sair"),
                  ],
                ),
                body: Container(
                  padding: EdgeInsets.all(5.0),
                  child: ScopedModelDescendant<UserModel>(
                    builder: (context, child, model) {
                      if (model.isLoading && model.isUserLogado()) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (!model.isUserLogado()) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.account_circle,
                                size: 80.0,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                "Faça o login para acessar seus dados.",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              RaisedButton(
                                child: Text(
                                  "Entrar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                textColor: Colors.white,
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LoginPageWidget()));
                                },
                              ),
                            ],
                          ),
                        );
                      } else {
                        //carregar os dados do usuário cadastrado

                        /*  
                        return FutureBuilder(
                          future:
                              model.getDadosCliente(model.returnoIdCliente()),
                          builder: (BuildContext context,
                              AsyncSnapshot<Cliente> snapshot) {
                            print("snapshot");
                            if (snapshot.data != null)
                              print("Nome ${snapshot.data.Nome}");
                            //não está caregando os dados no snapshot

                            _nomeController = new TextEditingController(
                                text: snapshot.data.Nome);
 */

                        _nomeController =
                            new TextEditingController(text: model.cliente.Nome);
                        _sobrenomeController = new TextEditingController(
                            text: model.cliente.SobreNome);
                        _emailController = new TextEditingController(
                            text: model.cliente.Email);
                        _telefoneController = new TextEditingController(
                            text: model.cliente.Telefone);
                        _cpfController =
                            new TextEditingController(text: model.cliente.Cpf);
                        _rgController =
                            new TextEditingController(text: model.cliente.Rg);
                        _enderecoController = new TextEditingController(
                            text: model.cliente.EndLogradouro);
                        _numeroController = new TextEditingController(
                            text: model.cliente.EndNumero);
                        _complementoController = new TextEditingController(
                            text: model.cliente.EndComplemento);
                        _bairroController = new TextEditingController(
                            text: model.cliente.EndBairro);
                        _cidadeController = new TextEditingController(
                            text: model.cliente.EndCidade);
                        _ufController = new TextEditingController(
                            text: model.cliente.EndUf);
                        _cepController = new TextEditingController(
                            text: model.cliente.EndCep);

                        _selectedDropNacionalidade =
                            model.cliente.Nacionalidade;
                        _selectedDropEstadiCivil = model.cliente.EstadoCivil;

                        //loadDropNacionalidad();
                        //loadDropEstadoCivil();
                        return Form(
                          key: _formKey,
                          child: ListView(
                              padding: EdgeInsets.all(16.0),
                              children: <Widget>[
                                TextFormField(
                                  controller: _nomeController,
                                  focusNode: _fnNome,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(
                                        context, _fnNome, _fnSobreNome);
                                  },
                                  decoration:
                                      InputDecoration(labelText: "Nome"),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: _sobrenomeController,
                                  focusNode: _fnSobreNome,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(
                                        context, _fnSobreNome, _fnEmail);
                                  },
                                  decoration:
                                      InputDecoration(labelText: "Sobrenome"),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  focusNode: _fnEmail,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(
                                        context, _fnEmail, _fnTel);
                                  },
                                  decoration:
                                      InputDecoration(labelText: "Email"),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: _telefoneController,
                                  focusNode: _fnTel,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(context, _fnTel, _fnCpf);
                                  },
                                  decoration:
                                      InputDecoration(labelText: "Telefone"),
                                  keyboardType: TextInputType.phone,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: _cpfController,
                                  focusNode: _fnCpf,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(context, _fnCpf, _fnRg);
                                  },
                                  decoration: InputDecoration(labelText: "CPF"),
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: _rgController,
                                  focusNode: _fnRg,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(context, _fnRg, _fnEnd);
                                  },
                                  decoration: InputDecoration(labelText: "RG"),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),

                                //NÃO ESTÁ FICANDO O REGISTRO SELECIONADO NA SELAÇÃO.

                                DropdownButton(
                                  hint: Text(
                                      _selectedDropNacionalidade == null ||
                                              _selectedDropNacionalidade ==
                                                  'NAO CADASTRADO'
                                          ? "Selecione"
                                          : "$_selectedDropNacionalidade"),
                                  //items: listaItensDropNacionalidade,
                                  items: <String>[
                                    "BRASILEIRA",
                                    "NATURALIZADO",
                                    "ARGENTINA",
                                    "BOLIVIANA",
                                    "CHILENA",
                                    "PARAGUIAIA",
                                    "URUGUAIA",
                                    "VENEZUELANO",
                                    "COLOMBIANO",
                                    "PERUANO",
                                    "EQUATORIANO",
                                    "ALEMÃ",
                                    "BELGA",
                                    "BRITÃNICA",
                                    "CANADENSE",
                                    "ESPANHOLA",
                                    "NORTE AMERICANA (E.U.A)",
                                    "FRANCESA",
                                    "SUIÇA",
                                    "ITALIANA",
                                    "HAITIANO",
                                    "JAPONESA",
                                    "CHINESA",
                                    "COREANA",
                                    "RUSSO",
                                    "PORTUGUESA",
                                    "PAQUISTANESA",
                                    "INDIANO",
                                    "OUTRAS LATINO-AMERICANAS",
                                    "OUTRAS ASIATICAS",
                                    "ANGOLANO",
                                    "CONGOLES",
                                    "SUL-AFRICANO"
                                  ].map((String value) {
                                    return new DropdownMenuItem<String>(
                                        child: new Text(value), value: value);
                                  }).toList(),

                                  //value: _selectedDropNacionalidade,
                                  icon: Icon(Icons.arrow_downward),
                                  iconSize: 20.0,
                                  focusNode: _fnNacionalidade,
                                  onChanged: (value) {
                                    _selectedDropNacionalidade = value;
                                    setState(() {});
                                    //print("Nacionalidade: $_selectedDropNacionalidade");
                                  },
                                  //isExpanded: false,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                DropdownButton(
                                  hint: Text(_selectedDropEstadiCivil == null ||
                                          _selectedDropEstadiCivil ==
                                              'NAO CADASTRADO'
                                      ? "Selecione"
                                      : "$_selectedDropEstadiCivil"),
                                  items: <String>[
                                    "SOLTEIRO",
                                    "CASADO",
                                    "DESQUITADO",
                                    "DIVORCIADO",
                                    "VIUVO",
                                    "AMASIADO",
                                    "UNIAO ESTAVEL",
                                    "SEP JUDICIALMENTE"
                                  ].map((String value) {
                                    return new DropdownMenuItem<String>(
                                        child: new Text(value), value: value);
                                  }).toList(),
                                  icon: Icon(Icons.arrow_downward),
                                  iconSize: 20.0,
                                  value: _selectedDropEstadiCivil,
                                  focusNode: _fnEstadoCivil,
                                  onChanged: (value) {
                                    _selectedDropEstadiCivil = value;
                                    setState(() {});
                                  },
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),

/*
                  TextFormField(
                    controller: _nacionalidadeController,
                    decoration: InputDecoration(hintText: "Nacionalidade"),
                    keyboardType: TextInputType.numberWithOptions(),
                    validator: (text) {
                      if (text.isEmpty)
                        return "Nacionalidade Inválido!!";
                      else
                        return "";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _estadocivilController,
                    decoration: InputDecoration(hintText: "Estado Civel"),
                    keyboardType: TextInputType.text,
                    validator: (text) {
                      if (text.isEmpty)
                        return "Estado Civil Inválido!!";
                      else
                        return "";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  */

                                TextFormField(
                                  controller: _enderecoController,
                                  focusNode: _fnEnd,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(
                                        context, _fnEnd, _fnEndNum);
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Endereço (Logradouro)"),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),

                                TextFormField(
                                  controller: _numeroController,
                                  focusNode: _fnEndNum,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(
                                        context, _fnEndNum, _fnEndCompl);
                                  },
                                  decoration:
                                      InputDecoration(labelText: "Número"),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),

                                TextFormField(
                                  controller: _complementoController,
                                  focusNode: _fnEndCompl,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(
                                        context, _fnEndCompl, _fnEndBairro);
                                  },
                                  decoration:
                                      InputDecoration(labelText: "Complemento"),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: _bairroController,
                                  focusNode: _fnEndBairro,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(
                                        context, _fnEndBairro, _fnEndCidade);
                                  },
                                  decoration:
                                      InputDecoration(labelText: "Bairro"),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: _cidadeController,
                                  focusNode: _fnEndCidade,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(
                                        context, _fnEndCidade, _fnEndUf);
                                  },
                                  decoration:
                                      InputDecoration(labelText: "Cidade"),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: _ufController,
                                  focusNode: _fnEndUf,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(
                                        context, _fnEndUf, _fnEndCep);
                                  },
                                  decoration: InputDecoration(labelText: "UF"),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: _cepController,
                                  focusNode: _fnEndCep,
                                  decoration: InputDecoration(labelText: "CEP"),
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                SizedBox(
                                  height: 40.0,
                                  child: RaisedButton(
                                      child: Text(
                                        "Salvar",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      textColor: Colors.white,
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        //print("click btn");
                                        //erro, não está funcionando

                                        if (_validaCampos()) {
                                          Map<String, dynamic> clienteData = {
                                            "Id": model.cliente.Id,
                                            "Nome": _nomeController.text,
                                            "SobreNome":
                                                _sobrenomeController.text,
                                            "Rg": _rgController.text,
                                            "Cpf": _cpfController.text,
                                            "Email": _emailController.text,
                                            "Telefone":
                                                _telefoneController.text,
                                            "EndLogradouro":
                                                _enderecoController.text,
                                            "EndNumero": _numeroController.text,
                                            "EndComplemento":
                                                _complementoController.text,
                                            "EndBairro": _bairroController.text,
                                            "EndCidade": _cidadeController.text,
                                            "EndUf": _ufController.text,
                                            "EndCep": _cepController.text,
                                            "EstadoCivil":
                                                _selectedDropEstadiCivil,
                                            "Nacionalidade":
                                                _selectedDropNacionalidade
                                          };
/*
                                print(
                                    "Nacionalidade: $_selectedDropNacionalidade");
                                print("EstadoCivil: $_selectedDropEstadiCivil");
 */
                                          model.setClienteData(
                                              clienteData: clienteData,
                                              onSuccess: _onSuccess,
                                              onFail: _onFail);

                                          model.atualizaDadosCliente();
                                        }
                                      }),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                SizedBox(
                                  height: 44.0,
                                  child: RaisedButton(
                                    child: Text(
                                      "Cancelar",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    textColor: Colors.white,
                                    color: Colors.red,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeWidget()));
                                    },
                                  ),
                                ),
                              ]),
                        );

/*
                          },
                        );
*/

                      } //else
                    },
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.monetization_on),
                        title: Text("Investimentos")),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle),
                        title: Text("Meus Dados")),
                  ],
                  currentIndex: 1,
                  selectedItemColor: Theme.of(context).accentColor,
                  onTap: _onItemTapped,
                ),
              );
            },
          ),
          //Scoped
        ],
      ),
    );
  }

  void _onSuccess() {
    //print("onSucces");

    _scaffoldkey.currentState.showSnackBar(SnackBar(
      content: Text(
        "Dados atualizados com sucesso!!",
        style: TextStyle(fontSize: 18.0),
      ),
      backgroundColor: Theme.of(context).accentColor,
      duration: Duration(seconds: 3),
    ));

    Future.delayed(Duration(seconds: 3)).then((_) {
      //Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeWidget()));
    });
  }

  void _onFail() {
    print("onFaii");
    _scaffoldkey.currentState.showSnackBar(SnackBar(
      content: Text(
        "Falha ao cadastrar!!",
        style: TextStyle(fontSize: 18.0),
      ),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 4),
    ));
  }

  void mensagem(String msn, String tipo) {
    //String msn = "Erro ao cadastrar:";
    _scaffoldkey.currentState.showSnackBar(SnackBar(
      content: Text(
        msn,
        style: TextStyle(fontSize: 18.0),
      ),
      backgroundColor:
          tipo.compareTo('erro') == 0 ? Colors.redAccent : Colors.green,
      duration: Duration(seconds: 4),
    ));
  }

/*
  String _validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }
*/
  String _validarCelular(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o celular";
    } else if (value.length < 11) {
      return "O número do telefone deve conter pelo menos 2 dígitos DDD + 9 dígitos do número! ";
    } else if (!regExp.hasMatch(value)) {
      return "O número do celular so deve conter dígitos";
    }
    return null;
  }

  String _validarEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if (!regExp.hasMatch(value)) {
      return "Email inválido";
    } else {
      return null;
    }
  }

  bool _validaCampos() {
    //print("Entrei validar campos");

    // Validar NOME
    if (("${_nomeController.text}").isEmpty) {
      FocusScope.of(context).requestFocus(_fnNome);
      mensagem("Digite o seu primeiro nome.", "erro");
      return false;
    }
// Validar SOBRENOME
    if (("${_sobrenomeController.text}").isEmpty) {
      FocusScope.of(context).requestFocus(_fnSobreNome);
      mensagem("Digite o seu Sobrenome.", "erro");
      return false;
    }

    // Validar EMAIL
    var mnsValidaEmail = _validarEmail("${_emailController.text}");
    if (mnsValidaEmail != null) {
      FocusScope.of(context).requestFocus(_fnEmail);
      mensagem(mnsValidaEmail, "erro");
      return false;
    }

    // Validar TELEFONE
    var msnValidaTel = _validarCelular("${_telefoneController.text}");
    //print("msnValidaTel: $msnValidaTel");

    if (msnValidaTel != null) {
      FocusScope.of(context).requestFocus(_fnTel);
      mensagem(msnValidaTel, "erro");
      return false;
    }

    // Validar CPF
    if (!CPF.isValid("${_cpfController.text}")) {
      FocusScope.of(context).requestFocus(_fnCpf);
      mensagem("Este CPF é inválido.", "erro");
      return false;
    }

    //validação dos dropdonw
    if (_selectedDropNacionalidade == null ||
        _selectedDropNacionalidade.isEmpty) {
      FocusScope.of(context).requestFocus(_fnNacionalidade);
      mensagem("Selecione a Nacionalidade.", "erro");
      return false;
    }

    //validação dos dropdonw
    if (_selectedDropEstadiCivil == null || _selectedDropEstadiCivil.isEmpty) {
      FocusScope.of(context).requestFocus(_fnEstadoCivil);
      mensagem("Selecione o Estado Civil.", "erro");
      return false;
    }

    // Validar Endereço
    if (("${_enderecoController.text}").isEmpty) {
      FocusScope.of(context).requestFocus(_fnEnd);
      mensagem("Digite o Logradrouro(Rua, Av, etc).", "erro");
      return false;
    }

// Validar Endereço Numero
    if (("${_numeroController.text}").isEmpty) {
      FocusScope.of(context).requestFocus(_fnEndNum);
      mensagem("Digite o Número do endereço.", "erro");
      return false;
    }
    // Validar Endereço BAirro
    if (("${_bairroController.text}").isEmpty) {
      FocusScope.of(context).requestFocus(_fnEndBairro);
      mensagem("Digite o Bairro.", "erro");
      return false;
    }

// Validar Endereço Cidade
    if (("${_cidadeController.text}").isEmpty) {
      FocusScope.of(context).requestFocus(_fnEndCidade);
      mensagem("Digite a Cidade.", "erro");
      return false;
    }

// Validar Endereço UF
    if (("${_ufController.text}").isEmpty) {
      FocusScope.of(context).requestFocus(_fnEndUf);
      mensagem("Digite o .", "erro");
      return false;
    }

    // Validar Endereço CEP
    if (("${_cepController.text}").isEmpty) {
      FocusScope.of(context).requestFocus(_fnEndCep);
      mensagem("Digite o .", "erro");
      return false;
    }

    return true;
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
