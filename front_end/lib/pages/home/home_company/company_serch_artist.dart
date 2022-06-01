import 'package:flutter/material.dart';
import 'package:front_end/components/custom_colors.dart';

class CompanySerchArtist extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          appBar: AppBar(
        title: Text('Buscar Artista'),
        centerTitle: true,
        backgroundColor: CustomColors().getBlueColorSecond(),
      ));
}
