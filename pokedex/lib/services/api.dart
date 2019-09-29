import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

class API {
  static final String baseUrl = 'http://192.168.1.24:8000';

  static Future getPokemons() async {
    var url = baseUrl + '/pokemons';
    try {
      var pokemons = await http.get(url);
      Iterable list = json.decode(pokemons.body);
      return list.map((elt) => Pokemon.fromJson(elt)).toList();
    } catch (e) {
      print(e);
    }
  }

  static Future getPokemon(int id) async {
    var url = baseUrl + '/pokemon/' + id.toString();
    try {
      return http.get(url);
    } catch (e) {
      print(e);
    }
  }
}
