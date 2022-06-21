import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/components/text_form_fild_patters.dart';
import 'package:front_end/models/register_estabelecimento_model.dart';
import 'package:http/http.dart' as http;
import 'package:front_end/models/register_artista_model.dart';

import '../../../components/custom_colors.dart';

class RegisterThreePage extends StatefulWidget {
  const RegisterThreePage({Key? key}) : super(key: key);

  @override
  State<RegisterThreePage> createState() => _RegisterThreePageState();
}

class _RegisterThreePageState extends State<RegisterThreePage> {
  final _formKey = GlobalKey<FormState>();
  final logradouroEC = TextEditingController();
  final complementoEC = TextEditingController();
  final numeroEC = TextEditingController();
  final cidadeEC = TextEditingController();
  final estadoEC = TextEditingController();

  late RegisterEstabelecimentoModel registerModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      registerModel = ModalRoute.of(context)?.settings.arguments
          as RegisterEstabelecimentoModel;
    });
  }

  @override
  void dispose() {
    super.dispose();
    logradouroEC.dispose();
    complementoEC.dispose();
    numeroEC.dispose();
    cidadeEC.dispose();
    estadoEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: CustomColors().getBackGround()),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  image: AssetImage('lib/assets/logo.png'),
                  width: 120,
                  color: CustomColors().getBlueColorPrimary(),
                ),
                SizedBox(height: 16),
                Text('Endereço da Empresa',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: CustomColors().getWordColor(),
                    )),
                SizedBox(height: 16),
                TextFildFormPatters(
                  controller: logradouroEC,
                  label: 'Logradouro',
                  iconLabel: Icons.gps_fixed,
                ),
                SizedBox(height: 16),
                TextFildFormPatters(
                  controller: complementoEC,
                  label: 'Complemento',
                  iconLabel: Icons.location_city,
                ),
                SizedBox(height: 16),
                TextFildFormPatters(
                  controller: numeroEC,
                  label: 'Numero',
                  iconLabel: Icons.location_city,
                ),
                SizedBox(height: 16),
                TextFildFormPatters(
                  controller: cidadeEC,
                  label: 'Cidade',
                  iconLabel: Icons.location_city,
                ),
                SizedBox(height: 16),
                TextFildFormPatters(
                  controller: estadoEC,
                  label: 'Esdado',
                  iconLabel: Icons.location_city,
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          var formValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            var model = registerModel.copyWith(
                                logradouro: logradouroEC.text,
                                complemento: complementoEC.text,
                                numero: numeroEC.text,
                                cidade: cidadeEC.text,
                                estado: estadoEC.text);
                            register(model);
                            Navigator.of(context, rootNavigator: true)
                                .pushReplacementNamed('/login');
                          }
                        },
                        child: Text('CADASTRAR'),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            primary: CustomColors().getActivePrimaryButton(),
                            padding: EdgeInsets.all(14)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('VOLTAR',
                            style: TextStyle(
                                color:
                                    CustomColors().getActivePrimaryButton())),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            primary: CustomColors().getActiveSecondButton(),
                            padding: EdgeInsets.all(14)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

register(RegisterEstabelecimentoModel model) async {
  var url = Uri.parse("https://match-artist.herokuapp.com/api/estabelecimento");

  var response = await http.post(url, body: {
    'name': model.name,
    'email': model.email,
    "password": model.password,
    "cnpj": model.cnpj,
    "contato": model.contato,
    "descricao": model.descricao,
    "genero": model.genero,
    "logradouro": model.logradouro,
    "complemento": model.complemento,
    "numero": model.numero,
    "cidade": model.cidade,
    "estado": model.estado,
  });
}
