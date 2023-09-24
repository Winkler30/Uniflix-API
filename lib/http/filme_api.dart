/*
{
  "filmes": [
    {
          "id": 1,
          "titulo": "O Resgate",
          "resumo":"Um suspense cheio de ação",
          "atores":"John Smith",
          "capa":"https://seriemaniacos.tv/wp-content/uploads/2020/04/Resgate-capa.jpg",
          "duracao":250
      },
    {
          "id": 2,
          "titulo": "A Jornada Espacial",
          "resumo":"Uma aventura no espaço sideral",
          "atores":"Jane Doe",
          "capa":"https://cinepop.com.br/wp-content/uploads/2020/03/A-Jornada.jpg",
          "duracao":270
      },
    {
          "id": 3,
          "titulo": "O Mistério da Ilha",
          "resumo":"Uma busca por tesouros perdidos",
          "atores":"Mike Johnson",
          "capa":"https://br.web.img3.acsta.net/pictures/19/09/23/08/37/2376090.jpg",
          "duracao":100
      },
    {
          "id": 4,
          "titulo": "Amor à Primeira Vista",
          "resumo":"Uma história romântica",
          "atores":"Emily Smith",
          "capa":"https://s2-techtudo.glbimg.com/m-IEXlEogiaO3602fdCabrWcCKQ=/0x0:1280x720/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2023/j/h/S8s90fTvGBkRcXHc3mYw/love1.jpg",
          "duracao":210
    }
   
   ],
} */

import 'dart:convert'; 
import '../model/filme.dart';
import 'package:http/http.dart' as http;

class FilmeApi {
  final String url =
      'https://my-json-server.typicode.com/Winkler30/my-api/filmes';
  Future<List<Filme>> getFilmes() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Falhou na busca da API');
    }

    final json = jsonDecode(response.body);
    final mapsFilmes = json.cast<Map<String, dynamic>>();
    List<Filme> listFilmes = [];

    for (var map in mapsFilmes) {
      Filme objfilme = Filme.fromJson(map);
      listFilmes.add(objfilme);
    }
    return listFilmes;
  }
}


