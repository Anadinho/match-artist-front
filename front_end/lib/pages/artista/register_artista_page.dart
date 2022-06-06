import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/pages/artista/steps/register_one_page.dart';
import 'package:front_end/pages/artista/steps/register_three_page.dart';
import 'package:front_end/pages/artista/steps/register_two_page.dart';

class RegisterArtistaPage extends StatefulWidget {
  RegisterArtistaPage({Key? key}) : super(key: key);

  @override
  State<RegisterArtistaPage> createState() => _RegisterArtistaPageState();
}

class _RegisterArtistaPageState extends State<RegisterArtistaPage> {
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
        appBar: AppBar(
          title: const Text('Cadastro de Artista'),
        ),
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
