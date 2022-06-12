import 'package:flutter/material.dart';
import 'package:front_end/controllers/artista_controller.dart';
import 'package:front_end/controllers/estabelecimento_controller.dart';
import 'package:front_end/models/artista_model.dart';
import 'package:front_end/models/estabelecimento_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EstabelecimentoIndexPage extends GetView<EstabelecimentoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estabelecimento'),
      ),
      body: controller.obx((state) {
        final EstabelecimentoModel item = state;
        return ListTile(
          title: Text(item.nome +
              " " +
              item.endereco.cidade +
              "-" +
              item.endereco.estado),
        );
      }, onError: (error) {
        return Center(child: Text(error!));
      }),
    );
  }
}
