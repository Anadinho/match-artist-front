import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front_end/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/custom_colors.dart';
import '../estabelecimento/estabelecimento_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isConect = false;
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String email = '';
  String password = '';

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
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Image(
                image: AssetImage('lib/assets/logo.png'),
                width: 160,
                color: Colors.blue[700],
              ),
              SizedBox(height: 25),
              Text('Entrar',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: CustomColors().getWordColor(),
                  )),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: CustomColors().getWordColor()),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: CustomColors().getWordColor()),
                        prefixIcon: Icon(
                          Icons.email,
                          color: CustomColors().getWordColor(),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: CustomColors().getWordColor(),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: CustomColors().getWordColor(),
                          ),
                        ),
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
                  )
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle:
                              TextStyle(color: CustomColors().getWordColor()),
                          prefixIcon: Icon(
                            Icons.vpn_key_sharp,
                            color: CustomColors().getWordColor(),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: CustomColors().getWordColor(),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: CustomColors().getWordColor(),
                            ),
                          ),
                        ),
                        style: TextStyle(color: CustomColors().getWordColor()),
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
                  )
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: this.isConect,
                    side: BorderSide(
                        color: CustomColors().getWordColor(), width: 2),
                    onChanged: (bool? newValue) {
                      setState(() {
                        this.isConect = newValue!;
                      });
                    },
                  ),
                  Text('Continuar conectado?',
                      style: TextStyle(color: CustomColors().getWordColor()))
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
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
                                  .pushReplacementNamed('/teste');
                            }
                          } else {
                            _passwordController.clear();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                        login();
                      },
                      child: Text('LOGIN'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          primary: CustomColors().getActivePrimaryButton(),
                          padding: EdgeInsets.all(14)),
                    ),
                  ),
                ],
              ),
              Divider(height: 50, color: CustomColors().getWordColor()),
              Text('Já tem conta?',
                  style: TextStyle(color: CustomColors().getWordColor())),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        showAlertDialog3(context);
                      },
                      child: Text(
                        'CADASTRE-SE',
                        style: TextStyle(
                            color: CustomColors().getActivePrimaryButton()),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          primary: CustomColors().getActiveSecondButton(),
                          padding: EdgeInsets.all(14)),
                    ),
                  ),
                ],
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

  showAlertDialog3(BuildContext context) {
    Widget artistButton = ElevatedButton(
      child: Text("Artista"),
      style: ElevatedButton.styleFrom(
        primary: CustomColors().getActivePrimaryButton(),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true)
            .pushReplacementNamed('/novoArtista');
      },
    );
    Widget companyButton = ElevatedButton(
      child: Text("Empresa"),
      style: ElevatedButton.styleFrom(
        primary: CustomColors().getActivePrimaryButton(),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true)
            .pushReplacementNamed('/novoEstabelecimento');
      },
    );
    Widget cancelButton = TextButton(
      child: Text("Cancelar"),
      style: TextButton.styleFrom(
        primary: Color(0xff6d0019),
        padding: EdgeInsets.all(8),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alert = AlertDialog(
      buttonPadding: EdgeInsets.symmetric(vertical: 2),
      title: Text("Nova Conta"),
      content: Text("Selecione seu perfil!"),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: artistButton,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: companyButton,
                ),
              ],
            ),
          ),
        ),
        cancelButton,
      ],
    );
    // exibe o dialogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
