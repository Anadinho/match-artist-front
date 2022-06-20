import 'dart:convert';

import 'package:front_end/models/endereco_model.dart';

class EventoModel {
  int id;
  String nome;
  String descricao;
  String data;
  int estabelecimento_id;
  String created_at;
  String updated_at;
  EventoModel({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.data,
    required this.estabelecimento_id,
    required this.created_at,
    required this.updated_at,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'nome': nome});
    result.addAll({'descricao': descricao});
    result.addAll({'data': data});
    result.addAll({'estabelecimento_id': estabelecimento_id});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory EventoModel.fromMap(Map<String, dynamic> map) {
    return EventoModel(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      descricao: map['descricao'] ?? '',
      data: map['data'] ?? '',
      estabelecimento_id: map['estabelecimento_id']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EventoModel.fromJson(String source) =>
      EventoModel.fromMap(json.decode(source));

  EventoModel copyWith({
    int? id,
    String? nome,
    String? descricao,
    String? data,
    int? estabelecimento_id,
    String? created_at,
    String? updated_at,
  }) {
    return EventoModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      data: data ?? this.data,
      estabelecimento_id: estabelecimento_id ?? this.estabelecimento_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  @override
  String toString() {
    return 'EventoModel(id: $id, nome: $nome, descricao: $descricao, data: $data, estabelecimento_id: $estabelecimento_id, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventoModel &&
        other.id == id &&
        other.nome == nome &&
        other.descricao == descricao &&
        other.data == data &&
        other.estabelecimento_id == estabelecimento_id &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  int get hasCode =>
      id.hashCode ^
      nome.hashCode ^
      descricao.hashCode ^
      data.hashCode ^
      estabelecimento_id.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
}
