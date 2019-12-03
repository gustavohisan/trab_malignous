import 'package:trab_malignous/Model/Postagem.dart';
void main() {
  Map<String, dynamic> json = 
  ({"IDPublicacao":1,
  "id_usuario":1,
  "id_topico":6,
  "data":"2019-09-15T11:53:09.000Z",
  "TituloPublicacao":"Ash finalmente vence a Liga Pokémon, depois de 22 anos",
  "corpo":"https://i.imgur.com/yio60Gp.jpg",
  "TituloTopico":"TudoAnimes",
  "situacao": true,
  "quant_avaliacoes":652,
  "tipo":"imagem",
  "nome":"GabrielZanetti",
  "foto":"https://i.imgur.com/a7s4g5Bg.jpg"});
  //Método postagem para converter o json em um objeto dart
  print("Inicio do testeOO na classe postagem:\n");
  Postagem postagem = Postagem.fromJson(json);
  if(postagem.id == 1){
      print("IDPublicacao transformado com sucesso.");
  }else{
      print("Não foi possível transformar IDPublicacao.");
  }
  if(postagem.idUsuario == 1){
      print("idUsuario transformado com sucesso.");
  }else{
      print("Não foi possível transformar idUsuario.");
  }
   if(postagem.idTopico == 6){
      print("IDPublicacao transformado com sucesso.");
  }else{
      print("Não foi possível transformar IDPublicacao.");
  }
  if(postagem.data == "2019-09-15T11:53:09.000Z"){
      print("Data transformado com sucesso.");
  }else{
      print("Não foi possível transformar data.");
  }
  if(postagem.tituloPublicacao == "Ash finalmente vence a Liga Pokémon, depois de 22 anos"){
      print("TituloPublicacao transformado com sucesso.");
  }else{
      print("Não foi possível transformar TituloPublicacao.");
  }
  if(postagem.corpo == "https://i.imgur.com/yio60Gp.jpg"){
      print("Corpo transformado com sucesso.");
  }else{
      print("Não foi possível transformar corpo.");
  }
   if(postagem.quantAvaliacoes == 652){
      print("Quant_avaliacoes transformado com sucesso.");
  }else{
      print("Não foi possível transformar quant_avaliacoes.");
  }
  if(postagem.situacao == true){
      print("Situação transformado com sucesso.");
  }else{
      print("Não foi possível transformar situação.");
  }
  if(postagem.tipo == "imagem"){
      print("Tipo transformado com sucesso.");
  }else{
      print("Não foi possível transformar tipo.");
  }
     if(postagem.nomeUsuario == "GabrielZanetti"){
      print("Nome transformado com sucesso.");
  }else{
      print("Não foi possível transformar nome.");
  }
  if(postagem.fotoTopico == "https://i.imgur.com/a7s4g5Bg.jpg"){
      print("Foto do tópico transformado com sucesso.");
  }else{
      print("Não foi possível transformar foto do tópico.");
  }
  print(postagem.toString());
  //Teste do método transformar a classe dart em um json
  print("\nTransformar a classe dart de volta em um json:\n");
  print(postagem.toJson().toString() + "\n");
}