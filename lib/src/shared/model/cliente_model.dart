class ClienteModel {
  int id = 0;
  String? nome;
  String? email;

  ClienteModel({this.nome, this.email});

  ClienteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['email'] = email;
    return data;
  }
}
