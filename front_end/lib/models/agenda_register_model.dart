import 'dart:convert';

class AgendaRegisterModel {
  String solicitante;
  String evento;
  String is_artista;
  String is_estabelecimento;
  String descricao;
  int artista_id;
  int estabelecimento_id;
  AgendaRegisterModel({
    required this.solicitante,
    required this.evento,
    required this.is_artista,
    required this.is_estabelecimento,
    required this.descricao,
    required this.artista_id,
    required this.estabelecimento_id,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'solicitante': solicitante});
    result.addAll({'evento': evento});
    result.addAll({'is_artista': is_artista});
    result.addAll({'is_estabelecimento': is_estabelecimento});
    result.addAll({'descricao': descricao});
    result.addAll({'artista_id': artista_id});
    result.addAll({'estabelecimento_id': estabelecimento_id});

    return result;
  }

  factory AgendaRegisterModel.fromMap(Map<String, dynamic> map) {
    return AgendaRegisterModel(
      solicitante: map['solicitante'] ?? '',
      evento: map['evento'] ?? '',
      is_artista: map['is_artista'] ?? '',
      is_estabelecimento: map['is_estabelecimento'] ?? '',
      descricao: map['descricao'] ?? '',
      artista_id: map['artista_id']?.toInt() ?? 0,
      estabelecimento_id: map['estabelecimento_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AgendaRegisterModel.fromJson(String source) =>
      AgendaRegisterModel.fromMap(json.decode(source));

  AgendaRegisterModel copyWith({
    String? solicitante,
    String? evento,
    String? is_artista,
    String? is_estabelecimento,
    String? descricao,
    int? artista_id,
    int? estabelecimento_id,
  }) {
    return AgendaRegisterModel(
      solicitante: solicitante ?? this.solicitante,
      evento: evento ?? this.evento,
      is_artista: is_artista ?? this.is_artista,
      is_estabelecimento: is_estabelecimento ?? this.is_estabelecimento,
      descricao: descricao ?? this.descricao,
      artista_id: artista_id ?? this.artista_id,
      estabelecimento_id: estabelecimento_id ?? this.estabelecimento_id,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AgendaRegisterModel &&
        other.solicitante == solicitante &&
        other.evento == evento &&
        other.is_artista == is_artista &&
        other.is_estabelecimento == is_estabelecimento &&
        other.descricao == descricao &&
        other.artista_id == artista_id &&
        other.estabelecimento_id == estabelecimento_id;
  }

  @override
  int get hashCode {
    return solicitante.hashCode ^
        evento.hashCode ^
        is_artista.hashCode ^
        is_estabelecimento.hashCode ^
        descricao.hashCode ^
        artista_id.hashCode ^
        estabelecimento_id.hashCode;
  }

  @override
  String toString() {
    return 'AgendaRegisterModel(solicitante: $solicitante, evento: $evento, is_artista: $is_artista, is_estabelecimento: $is_estabelecimento, descricao: $descricao, artista_id: $artista_id, estabelecimento_id: $estabelecimento_id)';
  }
}
