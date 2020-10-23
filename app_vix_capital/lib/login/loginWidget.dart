import 'package:app_vix_capital/login/pages/loginPageWidget.dart';
import 'package:app_vix_capital/login/pages/loginSingUpPageWidget.dart';
import 'package:app_vix_capital/login/provider/providerPageController.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  PageController _pageController;

  List<Widget> pages = [LoginPageWidget(), LoginSingUpPageWidget()];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/grafico02.jpg",
            fit: BoxFit.cover,
          ),
          LoginPageWidget(),
          ProviderPageController(
            controller: _pageController,
            child: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              itemBuilder: (BuildContext context, int index) {
                return pages[index];
              },
              /*
              <Widget>[
                LoginSingUpPageWidget(),
                LoginPageWidget(),
                //LoginSingInPageWidget()
              ],
*/
            ),
          ),
        ],
      ),
    );
  }
}
