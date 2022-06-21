import 'dart:convert';

import 'package:front_end/models/agenda_model.dart';
import 'package:front_end/models/agenda_register_model.dart';
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

  @override
  Future storeAgendaEstabelecimento(
      int artistaId, String descricao, int? idEvento) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final acess_token = sharedPreference.getString('acess_token');
    final id_estabelecimento = sharedPreference.getString('id_estabelecimento');

    Map<String, String> header = {
      'authorization': "${acess_token}",
      'Accept': "application/json"
    };

    Map<String, String> body = {
      "solicitante": "ESTABELECIMENTO",
      "evento": "2022-03-25 02:02:02",
      "is_artista": "NAO",
      "is_estabelecimento": "SIM",
      "descricao": "${descricao}",
      "artista_id": "${artistaId}",
      "estabelecimento_id": "${id_estabelecimento}",
      "evento_id": "${idEvento}"
    };

    final response = await http.post(
        Uri.parse('https://match-artist.herokuapp.com/api/agenda'),
        headers: header,
        body: body);

    final List<dynamic> responseMap = jsonDecode(response.body);

    final teste = responseMap.map((e) => e as String);
    return teste;
  }
}
