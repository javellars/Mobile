class Cad {
  String? nome;
  String? email;
  String? senha;
  String? cadId;

  Cad({
    this.nome = "",
    this.email = "",
    this.senha = "",
    this.cadId = "",
  });

  // Construtor com parâmetros nomeados
  Cad.withData({this.nome = "", this.email = "", this.senha = ""});

  Cad.fromMap(Map<String, dynamic> map) {
    nome = map['nome'];
    email = map['email'];
    senha = map['senha'];
    cadId = map['cadId'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["nome"] = nome;
    map["email"] = email;
    map["senha"] = senha;
    map["cadId"] = cadId;
    return map;
  }
}
