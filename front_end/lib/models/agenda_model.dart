import 'dart:convert';

import 'package:front_end/models/endereco_model.dart';

class AgendaModel {
  int id;
  String solicitante;
  String evento;
  String is_artista;
  String is_estabelecimento;
  String artista;
  String nome_evento;
  String estabelecimento;
  AgendaModel({
    required this.id,
    required this.solicitante,
    required this.evento,
    required this.is_artista,
    required this.is_estabelecimento,
    required this.artista,
    required this.nome_evento,
    required this.estabelecimento,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'solicitante': solicitante});
    result.addAll({'evento': evento});
    result.addAll({'is_artista': is_artista});
    result.addAll({'is_estabelecimento': is_estabelecimento});
    result.addAll({'artista': artista});
    result.addAll({'nome_evento': nome_evento});
    result.addAll({'estabelecimento': estabelecimento});

    return result;
  }

  factory AgendaModel.fromMap(Map<String, dynamic> map) {
    return AgendaModel(
      id: map['id']?.toInt() ?? 0,
      solicitante: map['solicitante'] ?? '',
      evento: map['evento'] ?? '',
      is_artista: map['is_artista'] ?? '',
      is_estabelecimento: map['is_estabelecimento'] ?? '',
      artista: map['artista'] ?? '',
      nome_evento: map['nome_evento'] ?? '',
      estabelecimento: map['estabelecimento'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AgendaModel.fromJson(String source) =>
      AgendaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AgendaModel(id: $id, solicitante: $solicitante, evento: $evento, is_artista: $is_artista, is_estabelecimento: $is_estabelecimento, artista: $artista, nome_evento: $nome_evento, estabelecimento: $estabelecimento)';
  }

  AgendaModel copyWith({
    int? id,
    String? solicitante,
    String? evento,
    String? is_artista,
    String? is_estabelecimento,
    String? artista,
    String? nome_evento,
    String? estabelecimento,
  }) {
    return AgendaModel(
      id: id ?? this.id,
      solicitante: solicitante ?? this.solicitante,
      evento: evento ?? this.evento,
      is_artista: is_artista ?? this.is_artista,
      is_estabelecimento: is_estabelecimento ?? this.is_estabelecimento,
      artista: artista ?? this.artista,
      nome_evento: nome_evento ?? this.nome_evento,
      estabelecimento: estabelecimento ?? this.estabelecimento,
    );
  }
}
