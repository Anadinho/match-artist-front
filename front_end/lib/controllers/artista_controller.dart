import 'package:get/get.dart';

import 'package:front_end/repositories/contract/i_artista_repository.dart';

class ArtistaController extends GetxController with StateMixin {
  final IArtistaRepository _artistaRepository;

  ArtistaController(
    this._artistaRepository,
  );

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    findArtistas();
  }

  void findArtistas() async {
    change([], status: RxStatus.loading());
    final dados = await _artistaRepository.findAllUsers();
    change(dados, status: RxStatus.success());
    // try {
    //   final dados = await _artistaRepository.findAllUsers();
    //   change(dados, status: RxStatus.success());
    // } catch (e) {
    //   change([], status: RxStatus.error('Erro ao buscar artistas'));
    // }
  }
}
