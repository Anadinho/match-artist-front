import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/components/custom_colors.dart';
import 'package:front_end/models/artista_model.dart';
import 'package:retrofit/http.dart';

class SubArtistaIndex extends StatelessWidget {
  const SubArtistaIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArtistaModel artista =
        ModalRoute.of(context)!.settings.arguments as ArtistaModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(artista.nome),
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Proposta',
                  labelStyle: TextStyle(color: CustomColors().getWordColor()),
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
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed('/proposta', arguments: artista);
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
