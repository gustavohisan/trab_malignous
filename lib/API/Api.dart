import 'package:dio/dio.dart';
import 'package:trab_malignous/Model/Postagem.dart';

  Uri url = Uri.parse('http://192.168.0.14:3000');

    Future<List<Postagem>>getPostagens() async {
    Response response = await Dio().request(
        url.toString() + '/Publicacoes',
        options:
            Options(headers: {"Accept": "application/json"}, method: 'GET'));
        List<Postagem> postagens = List<Postagem>();
        for(Map<String, dynamic> item in response.data) {
          postagens.add(Postagem.fromJson(item));
        }

    return postagens;
  }
