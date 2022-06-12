import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/models/register_estabelecimento_model.dart';

import '../../../components/custom_colors.dart';

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
              TextFormField(
                controller: cnpjEC,
                style: TextStyle(color: CustomColors().getWordColor()),
                decoration: InputDecoration(
                  labelText: 'CNPJ',
                  labelStyle: TextStyle(color: CustomColors().getWordColor()),
                  prefixIcon: Icon(
                    Icons.home_work_rounded,
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
                controller: contatoEC,
                style: TextStyle(color: CustomColors().getWordColor()),
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  labelStyle: TextStyle(color: CustomColors().getWordColor()),
                  prefixIcon: Icon(
                    Icons.phone,
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
                controller: descricaoEC,
                style: TextStyle(color: CustomColors().getWordColor()),
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  labelStyle: TextStyle(color: CustomColors().getWordColor()),
                  prefixIcon: Icon(
                    Icons.work,
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
                controller: generoEC,
                style: TextStyle(color: CustomColors().getWordColor()),
                decoration: InputDecoration(
                  labelText: 'Genero Musical',
                  labelStyle: TextStyle(color: CustomColors().getWordColor()),
                  prefixIcon: Icon(
                    Icons.work,
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
