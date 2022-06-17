import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/models/register_estabelecimento_model.dart';

import '../../../components/custom_colors.dart';
import '../../../components/text_form_fild_patters.dart';

class RegisterTwoPage extends StatefulWidget {
  const RegisterTwoPage({Key? key}) : super(key: key);

  @override
  State<RegisterTwoPage> createState() => _RegisterTwoPageState();
}

class _RegisterTwoPageState extends State<RegisterTwoPage> {
  final cnpjEC = TextEditingController();
  final contatoEC = TextEditingController();
  final descricaoEC = TextEditingController();
  final generoEC = TextEditingController();

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
    cnpjEC.dispose();
    contatoEC.dispose();
    descricaoEC.dispose();
    generoEC.dispose();
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
              Text('Dados Empresariais',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: CustomColors().getWordColor(),
                  )),
              SizedBox(height: 16),
              TextFildFormPatters(
                controller: cnpjEC,
                label: 'CNPJ',
                iconLabel: Icons.home_work_rounded,
              ),
              SizedBox(height: 16),
              TextFildFormPatters(
                controller: contatoEC,
                label: 'Telefone',
                iconLabel: Icons.phone,
              ),
              SizedBox(height: 16),
              TextFildFormPatters(
                controller: descricaoEC,
                label: 'Descrição',
                iconLabel: Icons.work,
              ),
              SizedBox(height: 16),
              TextFildFormPatters(
                controller: generoEC,
                label: 'Genero Musical',
                iconLabel: Icons.work,
              ),
              SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        var model = registerModel.copyWith(
                            cnpj: cnpjEC.text,
                            contato: contatoEC.text,
                            descricao: descricaoEC.text,
                            genero: generoEC.text);
                        Navigator.pushNamed(context, '/three',
                            arguments: model);
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
                        Navigator.pop(context);
                      },
                      child: Text('VOLTAR',
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
