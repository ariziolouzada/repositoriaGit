import 'package:app_vix_capital/login/loginWidget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/userModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: 'Vix Capital',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xFF1B3D72),
          accentColor: Color(0xFFAABD00),
        ),
        debugShowCheckedModeBanner: false,
        home: //RendimentoWidget(),
            // HomeWidget(),
            LoginWidget(),
        //RendimentoGrafico(),
        //Grafico(),
      ),
    );
  }
}
