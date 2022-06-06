import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/models/register_estabelecimento_model.dart';

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
    return Center(
      child: Column(
        children: [
          Text(
            'Dados Pessoais',
            style: Theme.of(context).textTheme.headline4,
          ),
          TextFormField(
            controller: cnpjEC,
            decoration: InputDecoration(labelText: 'Cnpj'),
          ),
          TextFormField(
            controller: contatoEC,
            decoration: InputDecoration(labelText: 'Contato'),
          ),
          TextFormField(
            controller: descricaoEC,
            decoration: InputDecoration(labelText: 'Descrição'),
          ),
          TextFormField(
            controller: generoEC,
            decoration: InputDecoration(labelText: 'Genero Musical'),
          ),
          ElevatedButton(
              onPressed: () {
                var model = registerModel.copyWith(
                    cnpj: cnpjEC.text,
                    contato: contatoEC.text,
                    descricao: descricaoEC.text,
                    genero: generoEC.text);
                Navigator.pushNamed(context, '/three', arguments: model);
              },
              child: Text('Proximo'))
        ],
      ),
    );
  }
}
