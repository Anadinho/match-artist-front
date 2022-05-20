import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front_end/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "e-mail",
                    ),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Campo Obrigatorio!';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_emailController.text)) {
                        return 'Campo invalido!';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "senha",
                      ),
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (senha) {
                        if (senha == null || senha.isEmpty) {
                          return 'Campo Obrigatorio!';
                        } else if (senha.length < 6) {
                          return "Por favor, digite uma senha maior que 6 caracteres";
                        }

                        return null;
                      }),
                  ElevatedButton(
                    onPressed: () async {
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (_formkey.currentState!.validate()) {
                        bool is_login = await login();

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }

                        if (is_login) {
                          SharedPreferences sharedPreference =
                              await SharedPreferences.getInstance();

                          if (sharedPreference.getString('role') == "2") {
                            Navigator.of(context)
                                .pushReplacementNamed('/artista');
                          } else {
                            Navigator.of(context)
                                .pushReplacementNamed('/estabelecimento');
                          }
                        } else {
                          _passwordController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                      login();
                    },
                    child: Text('Entrar'),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  final snackBar = SnackBar(
      content: Text(
        'e-mail ou senha invalidos!',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.redAccent);

  Future<bool> login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse("https://match-artist.herokuapp.com/api/login");

    var response = await http.post(url, body: {
      'email': _emailController.text,
      "password": _passwordController.text
    });

    if (response.statusCode == 200) {
      await sharedPreferences.setString(
          'acess_token', "Bearer ${jsonDecode(response.body)["acess_token"]}");

      if (jsonDecode(response.body)["role"] == 2) {
        await sharedPreferences.setString(
            'role', "${jsonDecode(response.body)["role"]}");

        await sharedPreferences.setString(
            'id_artista', "${jsonDecode(response.body)["id_artista"]}");

        await sharedPreferences.setString(
            'name', "${jsonDecode(response.body)["name"]}");

        await sharedPreferences.setString(
            'id_user', "${jsonDecode(response.body)["id_user"]}");
      } else {
        await sharedPreferences.setString(
            'role', "${jsonDecode(response.body)["role"]}");

        await sharedPreferences.setString('id_estabelecimento',
            "${jsonDecode(response.body)["id_estabelecimento"]}");

        await sharedPreferences.setString(
            'name', "${jsonDecode(response.body)["name"]}");

        await sharedPreferences.setString(
            'id_user', "${jsonDecode(response.body)["id_user"]}");
      }
      print(jsonDecode(response.body));
      return true;
    } else {
      return false;
    }
  }
}
