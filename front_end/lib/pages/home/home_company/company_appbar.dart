import 'package:flutter/material.dart';

import '../../../components/custom_colors.dart';

AppBar getCompanyAppBar() {
  return AppBar(
    title: Text('Perfil'),
    centerTitle: true,
    backgroundColor: CustomColors().getBlueColorSecond(),
    actions: [
      IconButton(
        icon: Icon(
          Icons.more_vert_rounded,
          color: Colors.white,
        ),
        onPressed: () {},
      )
    ],
  );
}
