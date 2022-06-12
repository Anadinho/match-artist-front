import 'dart:convert';

import 'package:front_end/models/agenda_model.dart';
import 'package:front_end/models/artista_model.dart';
import 'package:front_end/repositories/contract/i_agenda_repository.dart';
import 'package:front_end/repositories/contract/i_artista_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AgendaRepository implements IAgendaRepository {
  @override
  Future<List<AgendaModel>> findAllAgendaEstabelecimento() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final acess_token = sharedPreference.getString('acess_token');
    final id_estabelecimento = sharedPreference.getString('id_estabelecimento');

    Map<String, String> header = {
      'authorization': "${acess_token}",
      'Accept': "application/json"
    };

    final response = await http.get(
        Uri.parse(
            'https://match-artist.herokuapp.com/api/agenda/estabelecimento/${id_estabelecimento}'),
        headers: header);

    final List<dynamic> responseMap = jsonDecode(response.body);
    return responseMap
        .map<AgendaModel>((resp) => AgendaModel.fromMap(resp))
        .toList();
  }
}
