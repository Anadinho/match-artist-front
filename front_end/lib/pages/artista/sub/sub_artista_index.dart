import 'package:flutter/material.dart';
import 'package:front_end/components/custom_colors.dart';
import 'package:front_end/controllers/agenda_controller.dart';
import 'package:front_end/controllers/evento_controller.dart';
import 'package:front_end/models/artista_model.dart';
import 'package:front_end/repositories/agenda_repository.dart';
import 'package:front_end/repositories/evento_repository.dart';

class SubArtistaIndex extends StatefulWidget {
  const SubArtistaIndex({Key? key}) : super(key: key);

  @override
  State<SubArtistaIndex> createState() => _SubArtistaIndexState();
}

class _SubArtistaIndexState extends State<SubArtistaIndex> {
  final _descricaoController = TextEditingController();
  String descricao = '';

  final AgendaController _controllerAgenda =
      AgendaController(AgendaRepository());

  final EventoController _controllerEvento =
      EventoController(EventoRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ArtistaModel artista =
        ModalRoute.of(context)!.settings.arguments as ArtistaModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Proposta'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                artista.nome,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 24),
              Text(
                artista.contato,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                artista.descricao,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                artista.genero,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                artista.endereco.cidade + " - " + artista.endereco.estado,
                style: TextStyle(fontSize: 16),
              ),
              // DropdownButton<String>(
              //     items: _controllerEvento.eventos, onChanged: onChanged),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Digite uma mensagem para o artista:',
                  // labelStyle: TextStyle(color: CustomColors().getWordColor()),
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
                controller: _descricaoController,
                keyboardType: TextInputType.text,
              ),
              TextButton(
                onPressed: () async {
                  final res = await _controllerAgenda.store(
                      artista.id, _descricaoController.text);

                  if (res.first == 'ok') {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Proposta enviada com sucesso!!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.popAndPushNamed(
                                context, '/estabelecimento'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Enviar Proposta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
