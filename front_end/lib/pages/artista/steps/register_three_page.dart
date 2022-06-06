import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:front_end/models/register_artista_model.dart';

class RegisterThreePage extends StatefulWidget {
  const RegisterThreePage({Key? key}) : super(key: key);

  @override
  State<RegisterThreePage> createState() => _RegisterThreePageState();
}

class _RegisterThreePageState extends State<RegisterThreePage> {
  final logradouroEC = TextEditingController();
  final complementoEC = TextEditingController();
  final numeroEC = TextEditingController();
  final cidadeEC = TextEditingController();
  final estadoEC = TextEditingController();

  late RegisterArtistaModel registerModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      registerModel =
          ModalRoute.of(context)?.settings.arguments as RegisterArtistaModel;
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
    return Center(
      child: Column(
        children: [
          Text(
            'Endereço',
            style: Theme.of(context).textTheme.headline4,
          ),
          TextFormField(
            controller: logradouroEC,
            decoration: InputDecoration(labelText: 'logradouro'),
          ),
          TextFormField(
            controller: complementoEC,
            decoration: InputDecoration(labelText: 'Complemento'),
          ),
          TextFormField(
            controller: numeroEC,
            decoration: InputDecoration(labelText: 'Numero'),
          ),
          TextFormField(
            controller: cidadeEC,
            decoration: InputDecoration(labelText: 'Cidade'),
          ),
          TextFormField(
            controller: estadoEC,
            decoration: InputDecoration(labelText: 'Estado'),
          ),
          ElevatedButton(
              onPressed: () {
                var model = registerModel.copyWith(
                    logradouro: logradouroEC.text,
                    complemento: complementoEC.text,
                    numero: numeroEC.text,
                    cidade: cidadeEC.text,
                    estado: estadoEC.text);
                register(model);
                Navigator.of(context, rootNavigator: true)
                    .pushReplacementNamed('/login');
              },
              child: Text('Cadastrar'))
        ],
      ),
    );
  }
}

register(RegisterArtistaModel model) async {
  var url = Uri.parse("https://match-artist.herokuapp.com/api/artista");

  var response = await http.post(url, body: {
    'name': model.name,
    'email': model.email,
    "password": model.password,
    "cpf": model.cpf,
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
