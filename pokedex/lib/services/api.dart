import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon_basic.dart';
import 'package:pokedex/models/pokemon_info.dart';

class API {
  static final String baseUrl = 'http://vps743774.ovh.net:8080/v1';
  static final API _instance = API._internal();

  factory API() {
    return _instance;
  }

  API._internal();

  Future<List<PokemonBasic>> getAll() async {
    var url = baseUrl + '/pokemons';
    try {
      var response = await http.get(url, headers:  {'Content-Type': 'application/json'});
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return list.map((elt) => PokemonBasic.fromJson(elt)).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<PokemonInfo> getPokemon(String name) async {
    var url = baseUrl + '/pokemon/' + name;
    try {
      var response = await http.get(url, headers:  {'Content-Type': 'application/json'});
      return PokemonInfo.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } catch (e) {
      print(e);
    }
  }
}
