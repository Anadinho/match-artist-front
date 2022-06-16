import 'package:flutter/cupertino.dart';
import 'package:front_end/models/artista_model.dart';
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

  ValueNotifier<List<ArtistaModel>> artistas =
      ValueNotifier<List<ArtistaModel>>([]);

  void findArtistas() async {
    change([], status: RxStatus.loading());
    try {
      artistas.value = await _artistaRepository.findAllUsers();
      change(artistas.value, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao buscar artistas'));
    }
  }
}
