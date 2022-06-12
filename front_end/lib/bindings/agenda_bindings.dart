// import 'package:front_end/controllers/artista_controller.dart';
import 'package:front_end/controllers/agenda_controller.dart';
import 'package:front_end/controllers/artista_controller.dart';
import 'package:front_end/controllers/estabelecimento_controller.dart';
import 'package:front_end/repositories/agenda_repository.dart';
import 'package:front_end/repositories/artista_repository.dart';
import 'package:front_end/repositories/contract/i_agenda_repository.dart';
import 'package:front_end/repositories/contract/i_artista_repository.dart';
import 'package:front_end/repositories/contract/i_estabelecimento_repository.dart';
import 'package:front_end/repositories/estabelecimento_repository.dart';
import 'package:get/get.dart';

class AgendaEstabelecimentoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IAgendaRepository>(AgendaRepository());
    Get.put(AgendaController(Get.find()));
  }
}
