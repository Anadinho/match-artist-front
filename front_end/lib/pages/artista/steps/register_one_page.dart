import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/models/register_artista_model.dart';

import '../../../components/custom_colors.dart';

class RegisterOnePage extends StatefulWidget {
  const RegisterOnePage({Key? key}) : super(key: key);

  @override
  State<RegisterOnePage> createState() => _RegisterOnePageState();
}

class _RegisterOnePageState extends State<RegisterOnePage> {
  bool showPassWord = true;
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('lib/assets/logo.png'),
                width: 120,
                color: CustomColors().getBlueColorPrimary(),
              ),
              SizedBox(height: 16),
              Text('Cadastro',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: CustomColors().getWordColor(),
                  )),
              SizedBox(height: 16),
              TextFormField(
                controller: nameEC,
                style: TextStyle(color: CustomColors().getWordColor()),
                decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: CustomColors().getWordColor()),
                  prefixIcon: Icon(
                    Icons.person,
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
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: emailEC,
                style: TextStyle(color: CustomColors().getWordColor()),
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: CustomColors().getWordColor()),
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
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordEC,
                style: TextStyle(color: CustomColors().getWordColor()),
                obscureText: this.showPassWord,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: CustomColors().getWordColor()),
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
              ),
              SizedBox(height: 16),
              TextFormField(
                style: TextStyle(color: CustomColors().getWordColor()),
                obscureText: this.showPassWord,
                decoration: InputDecoration(
                  labelText: 'Confirmar Senha',
                  labelStyle: TextStyle(color: CustomColors().getWordColor()),
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
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: this.showPassWord,
                    activeColor: Colors.blue,
                    onChanged: (bool? newValue) {
                      setState(() {
                        this.showPassWord = newValue!;
                      });
                    },
                  ),
                  Text(
                    'Ocultar senha',
                    style: TextStyle(color: CustomColors().getWordColor()),
                  )
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        var model = RegisterArtistaModel(
                            name: nameEC.text,
                            email: emailEC.text,
                            password: passwordEC.text);
                        Navigator.pushNamed(context, '/two', arguments: model);
                      },
                      child: Text('PRÓXIMO'),
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
                        Navigator.of(context, rootNavigator: true)
                            .pushReplacementNamed('/homePage');
                      },
                      child: Text('SAIR',
                          style: TextStyle(
                              color: CustomColors().getActivePrimaryButton())),
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
    );
  }
}
