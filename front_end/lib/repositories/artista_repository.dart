import 'dart:convert';

import 'package:front_end/models/artista_model.dart';
import 'package:front_end/repositories/contract/i_artista_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ArtistaRepository implements IArtistaRepository {
  @override
  Future<List<ArtistaModel>> findAllUsers() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final acess_token = sharedPreference.getString('acess_token');

    Map<String, String> header = {
      'authorization': "${acess_token}",
      'Accept': "application/json"
    };

    final response = await http.get(
        Uri.parse('https://match-artist.herokuapp.com/api/artista'),
        headers: header);

    final List<dynamic> responseMap = jsonDecode(response.body)['data'];
    return responseMap
        .map<ArtistaModel>((resp) => ArtistaModel.fromMap(resp))
        .toList();
  }

  Future<ArtistaModel> findAllArtistas() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final acess_token = sharedPreference.getString('acess_token');
    final id_artista = sharedPreference.getString('id_artista');

    Map<String, String> header = {
      'authorization': "${acess_token}",
      'Accept': "application/json"
    };

    final response = await http.get(
        Uri.parse(
            'https://match-artist.herokuapp.com/api/artista/${id_artista}'),
        headers: header);

    final Map<String, dynamic> responseMap = jsonDecode(response.body)['data'];

    print(responseMap);
    return ArtistaModel.fromMap(responseMap);
  }
}
