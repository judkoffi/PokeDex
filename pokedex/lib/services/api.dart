import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

class API {
  static final String baseUrl = 'http://vps743774.ovh.net:8080/v1';
  final HashMap<int, Pokemon> cache = new HashMap();

  Future getPokemons() async {
    var url = baseUrl + '/pokemons';
    if (cache.isNotEmpty) {
      return Future.value(List.of(cache.values));
    }
    try {
      var request =
          await http.get(url, headers: {'Content-Type': 'application/json'});
      Iterable list = json.decode(utf8.decode(request.bodyBytes));
      var pokemons = list.map((elt) => Pokemon.fromJson(elt)).toList();
      pokemons
          .forEach((pokemon) => cache.putIfAbsent(pokemon.id, () => pokemon));
      return Future.value(pokemons);
    } catch (e) {
      print(e);
    }
  }

  Future getPokemon(int id) async {
    var url = baseUrl + '/pokemon/' + id.toString();
    try {
      return http.get(url);
    } catch (e) {
      print(e);
    }
  }
}
