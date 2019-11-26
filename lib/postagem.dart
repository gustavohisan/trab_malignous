class Postagem {
  int iD;
  String titulo;
  String conteudo;
  String tipo;

  Postagem({this.iD, this.titulo, this.conteudo, this.tipo});

  Postagem.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    titulo = json['titulo'];
    conteudo = json['conteudo'];
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['titulo'] = this.titulo;
    data['conteudo'] = this.conteudo;
    data['tipo'] = this.tipo;
    return data;
  }
}
