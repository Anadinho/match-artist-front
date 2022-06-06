class RegisterArtistaModel {
  final String? name;
  final String? email;
  final String? password;
  final String? cpf;
  final String? contato;
  final String? descricao;
  final String? genero;
  final String? logradouro;
  final String? complemento;
  final String? numero;
  final String? cidade;
  final String? estado;

  RegisterArtistaModel({
    this.name,
    this.email,
    this.password,
    this.cpf,
    this.contato,
    this.descricao,
    this.genero,
    this.logradouro,
    this.complemento,
    this.numero,
    this.cidade,
    this.estado,
  });

  RegisterArtistaModel copyWith({
    String? name,
    String? email,
    String? password,
    String? cpf,
    String? contato,
    String? descricao,
    String? genero,
    String? logradouro,
    String? complemento,
    String? numero,
    String? cidade,
    String? estado,
  }) {
    return RegisterArtistaModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      cpf: cpf ?? this.cpf,
      contato: contato ?? this.contato,
      descricao: descricao ?? this.descricao,
      genero: genero ?? this.genero,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      numero: numero ?? this.numero,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
    );
  }

  @override
  String toString() =>
      "RegisterArtistaModel(name: $name, email: $email, password: $password, cpf: $cpf, contato:$contato, descricao:$descricao, genero: $genero, logradouro: $logradouro, complemento: $complemento, numero: $numero, cidade: $cidade, estado: $estado)";
}
