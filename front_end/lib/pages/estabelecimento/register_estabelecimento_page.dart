import 'package:flutter/material.dart';
import 'package:front_end/pages/estabelecimento/steps/register_one_page.dart';
import 'package:front_end/pages/estabelecimento/steps/register_three_page.dart';
import 'package:front_end/pages/estabelecimento/steps/register_two_page.dart';

class RegisterEstabelecimentoPage extends StatefulWidget {
  RegisterEstabelecimentoPage({Key? key}) : super(key: key);

  @override
  State<RegisterEstabelecimentoPage> createState() =>
      _RegisterEstabelecimentoPageState();
}

class _RegisterEstabelecimentoPageState
    extends State<RegisterEstabelecimentoPage> {
  var navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPopNavRegister = navKey.currentState?.canPop() ?? false;
        if (canPopNavRegister) {
          navKey.currentState?.pop();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Navigator(
          initialRoute: '/one',
          key: navKey,
          onGenerateRoute: ((settings) {
            var route = settings.name;

            Widget page;

            switch (route) {
              case '/one':
                page = RegisterOnePage();
                break;

              case '/two':
                page = RegisterTwoPage();
                break;

              case '/three':
                page = RegisterThreePage();
                break;

              default:
                return null;
            }

            return MaterialPageRoute(
                builder: (context) => page, settings: settings);
          }),
        ),
      ),
    );
  }
}
