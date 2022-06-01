import 'package:flutter/material.dart';

import '../../../components/custom_colors.dart';

AppBar getCompanyAppBar() {
  return AppBar(
    title: Text("Artistas Contratados"),
    centerTitle: true,
    backgroundColor: CustomColors().getBlueColorPrimary(),
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
