import 'package:app_vix_capital/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginSingUpPageWidget extends StatefulWidget {
  @override
  _LoginSingUpPageWidgetState createState() => _LoginSingUpPageWidgetState();
}

class _LoginSingUpPageWidgetState extends State<LoginSingUpPageWidget> {
  @override
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _cpfController = TextEditingController();
  final _valorInvestimentoController = TextEditingController();

  final _formKey = new GlobalKey<FormState>();
  final _scaffoldkey = new GlobalKey<ScaffoldState>();
  //bool _validate = false;

  final FocusNode _fnNome = FocusNode();
  final FocusNode _fnEmail = FocusNode();
  final FocusNode _fnTel = FocusNode();
  final FocusNode _fnNCpf = FocusNode();
  final FocusNode _fnValorInvest = FocusNode();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
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
              padding: EdgeInsets.all(10.0),
              children: [
                Image.asset(
                  "assets/logos/novaLogoPq.png",
                  width: 130.0,
                  height: 130.0,
                ),
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: "Nome"),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  focusNode: _fnNome,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  focusNode: _fnEmail,
                ),
                TextFormField(
                  controller: _telefoneController,
                  focusNode: _fnTel,
                  // onFieldSubmitted: (term) {
                  //   _fieldFocusChange(context, _fnTel, _fnNCpf);
                  // },
                  decoration: InputDecoration(labelText: "Telefone"),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                MaskedTextField(
                  focusNode: _fnNCpf,
                  maskedTextFieldController: _cpfController,
                  mask: "xxx.xxx.xxx-xx",
                  maxLength: 14,
                  keyboardType: TextInputType.number,
                  inputDecoration: new InputDecoration(
                      //hintText: "CPF",
                      labelText: "CPF"),
                ),
                TextFormField(
                  controller: _valorInvestimentoController,
                  focusNode: _fnValorInvest,
                  decoration: InputDecoration(labelText: "Valor Investimento"),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
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
                    child: Text(
                      "cadastrar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
