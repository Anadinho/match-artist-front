import 'dart:convert';
import 'package:front_end/models/estabelecimento_model.dart';
import 'package:front_end/repositories/contract/i_estabelecimento_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EstabelecimentoRepository implements IEstabelecimentoRepository {
  @override
  Future<List<EstabelecimentoModel>> findAllEstabelecimentos() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final acess_token = sharedPreference.getString('acess_token');

    Map<String, String> header = {
      'authorization': "${acess_token}",
      'Accept': "application/json"
    };

    final response = await http.get(
        Uri.parse('https://match-artist.herokuapp.com/api/estabelecimento'),
        headers: header);

    final List<dynamic> responseMap = jsonDecode(response.body)['data'];
    return responseMap
        .map<EstabelecimentoModel>((resp) => EstabelecimentoModel.fromMap(resp))
        .toList();
  }
}
