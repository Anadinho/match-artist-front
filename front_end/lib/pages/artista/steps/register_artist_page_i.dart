import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/models/register_artista_model.dart';
import 'package:validatorless/validatorless.dart';

import '../../../components/custom_colors.dart';
import '../../../components/text_form_fild_patters.dart';

class RegisterOnePage extends StatefulWidget {
  const RegisterOnePage({Key? key}) : super(key: key);

  @override
  State<RegisterOnePage> createState() => _RegisterOnePageState();
}

class _RegisterOnePageState extends State<RegisterOnePage> {
  final _formKey = GlobalKey<FormState>();
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
                Text('Cadastro',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: CustomColors().getWordColor(),
                    )),
                SizedBox(height: 16),
                TextFildFormPatters(
                  controller: nameEC,
                  label: 'Nome',
                  iconLabel: Icons.person,
                ),
                SizedBox(height: 16),
                TextFildFormPatters(
                    controller: emailEC,
                    label: 'E-mail',
                    iconLabel: Icons.email,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Campo Obrigatorio'),
                        Validatorless.email('E-mail invalido!'),
                      ],
                    )),
                SizedBox(height: 16),
                TextFildFormPatters(
                    controller: passwordEC,
                    label: 'Senha',
                    iconLabel: Icons.vpn_key_sharp,
                    obscureText: this.showPassWord,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Campo Obrigatorio'),
                      ],
                    )),
                SizedBox(height: 16),
                TextFildFormPatters(
                    label: 'Confirmar Senha',
                    iconLabel: Icons.vpn_key_sharp,
                    obscureText: this.showPassWord,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.compare(passwordEC, 'Senha diferente'),
                      ],
                    )),
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
                          var formValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            var model = RegisterArtistaModel(
                                name: nameEC.text,
                                email: emailEC.text,
                                password: passwordEC.text);
                            Navigator.pushNamed(context, '/two',
                                arguments: model);
                          }
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
