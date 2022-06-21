import 'package:front_end/models/artista_model.dart';

abstract class IArtistaRepository {
  Future<List<ArtistaModel>> findAllUsers();
  Future<ArtistaModel> findAllArtistas();
}
