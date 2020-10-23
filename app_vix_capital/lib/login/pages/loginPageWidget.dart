import 'package:app_vix_capital/home/homeWidget.dart';
import 'package:app_vix_capital/login/pages/loginSingUpPageWidget.dart';
import 'package:app_vix_capital/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPageWidget extends StatefulWidget {
  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  final _passController = TextEditingController();
  final _emailController = TextEditingController();

  final FocusNode _fnEmail = FocusNode();
  final FocusNode _fnPass = FocusNode();

//Begin - teste animação btn
  bool carregando = false;
  _onTap(bool value) {
    setState(() {
      carregando = value;
    });
  }
  // End - teste

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.white.withOpacity(0.95),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          /*
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
            */

          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Image.asset(
                  "assets/logos/novaLogoMd.png",
                  //width: 400.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _emailController,
                  focusNode: _fnEmail,
                  onFieldSubmitted: (term) {
                    _fieldFocusChange(context, _fnEmail, _fnPass);
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: _passController,
                  focusNode: _fnPass,
                  decoration: InputDecoration(labelText: "Senha"),
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    if (_validaCampos()) {
                      _onTap(model.isLoading);
                      model.singIn(
                          email: _emailController.text,
                          pass: _passController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail);
                    }

                    _onTap(model.isLoading);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 800),
                    //width: carregando ? 5 : 20,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          BorderRadius.circular(10), //carregando ? 50 : 10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: carregando
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text(
                            "Entrar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      FlatButton(
                        onPressed: () {
                          if (_emailController.text.isEmpty) {
                            _scaffoldkey.currentState.showSnackBar(SnackBar(
                              content: Text(
                                "Digite seu email cadastrado para receber link de reset de senha!!",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              backgroundColor: Colors.redAccent,
                              duration: Duration(seconds: 3),
                            ));
                          } else {
                            var result = _validarEmail(_emailController.text);
                            if (result == null) {
                              model.esqueciMinhaSenha(
                                  email: _emailController.text,
                                  onSuccessEsqSenha: _onSuccessEsqSenha,
                                  onFailEsqSenha: _onFailEsqSenha);
                            } else {
                              mensagem(result, 'erro');
                            }
                          }
                        },
                        child: Text(
                          "Esqueci minha senha",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          //print("Clicou Cadastro.");
                          //ProviderPageController.of(context).toPage(1);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginSingUpPageWidget(),
                            ),
                          );
                        },
                        child: Text(
                          "Cadastro",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSuccess() {
    //_onTap(false);
    //Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeWidget()));
  }

  void _onFail() {
    _onTap(false);
    _scaffoldkey.currentState.showSnackBar(SnackBar(
      content: Text(
        "Falha ao realizar o login!!",
        style: TextStyle(fontSize: 18.0),
      ),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }

  void _onSuccessEsqSenha() {
    _scaffoldkey.currentState.showSnackBar(SnackBar(
      content: Text(
        "Foi enviado para seu email um link para criar uma nova senha!!",
        style: TextStyle(fontSize: 18.0),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 3),
    ));
  }

  void _onFailEsqSenha() {
    _scaffoldkey.currentState.showSnackBar(SnackBar(
      content: Text(
        "Falha ao enviar link para criar nova senha. Tente novamente!!",
        style: TextStyle(fontSize: 18.0),
      ),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 3),
    ));
  }

  void mensagem(String msn, String tipo) {
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
    // Validar EMAIL
    var mnsValidaEmail = _validarEmail("${_emailController.text}");
    if (mnsValidaEmail != null) {
      FocusScope.of(context).requestFocus(_fnEmail);
      mensagem(mnsValidaEmail, "erro");
      return false;
    }

    // Validar Senha
    if (("${_passController.text}").isEmpty) {
      FocusScope.of(context).requestFocus(_fnPass);
      mensagem("Digite a Senha.", "erro");
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
