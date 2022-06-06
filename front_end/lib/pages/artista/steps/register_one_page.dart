import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/models/register_artista_model.dart';

class RegisterOnePage extends StatefulWidget {
  const RegisterOnePage({Key? key}) : super(key: key);

  @override
  State<RegisterOnePage> createState() => _RegisterOnePageState();
}

class _RegisterOnePageState extends State<RegisterOnePage> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Credenciais',
            style: Theme.of(context).textTheme.headline4,
          ),
          TextFormField(
            controller: nameEC,
            decoration: InputDecoration(labelText: 'Nome'),
          ),
          TextFormField(
            controller: emailEC,
            decoration: InputDecoration(labelText: 'E-mail'),
          ),
          TextFormField(
            controller: passwordEC,
            decoration: InputDecoration(labelText: 'Senha'),
          ),
          ElevatedButton(
            onPressed: () {
              var model = RegisterArtistaModel(
                  name: nameEC.text,
                  email: emailEC.text,
                  password: passwordEC.text);
              Navigator.pushNamed(context, '/two', arguments: model);
            },
            child: Text('Proximo'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pushReplacementNamed('/homePage');
            },
            child: Text('Sair'),
          ),
        ],
      ),
    );
  }
}
