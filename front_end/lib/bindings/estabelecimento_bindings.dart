// import 'package:front_end/controllers/artista_controller.dart';
import 'package:front_end/controllers/artista_controller.dart';
import 'package:front_end/controllers/estabelecimento_controller.dart';
import 'package:front_end/repositories/artista_repository.dart';
import 'package:front_end/repositories/contract/i_artista_repository.dart';
import 'package:front_end/repositories/contract/i_estabelecimento_repository.dart';
import 'package:front_end/repositories/estabelecimento_repository.dart';
import 'package:get/get.dart';

class EstabelecimentoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IEstabelecimentoRepository>(EstabelecimentoRepository());
    Get.put(EstabelecimentoController(Get.find()));
  }
}
