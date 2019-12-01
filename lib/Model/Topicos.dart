class Topicos {
  int id;
  String titulo;
  String descricao;
  int idUsuario;
  String foto;

  Topicos({this.id, this.titulo, this.descricao, this.idUsuario, this.foto});

  Topicos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    idUsuario = json['id_usuario'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['id_usuario'] = this.idUsuario;
    data['foto'] = this.foto;
    return data;
  }
}