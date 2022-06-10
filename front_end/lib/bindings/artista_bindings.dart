// import 'package:front_end/controllers/artista_controller.dart';
import 'package:front_end/controllers/artista_controller.dart';
import 'package:front_end/repositories/artista_repository.dart';
import 'package:front_end/repositories/contract/i_artista_repository.dart';
import 'package:get/get.dart';

class ArtistaBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IArtistaRepository>(ArtistaRepository());
    Get.put(ArtistaController(Get.find()));
  }
}
