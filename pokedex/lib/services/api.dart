import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon_basic.dart';
import 'package:pokedex/models/pokemon_info.dart';

class API {
  static final String baseUrl = 'http://vps743774.ovh.net:8080/v1';
  final HashMap<int, PokemonBasic> cache = new HashMap();
  static final API _instance = API._internal();

  final Map headers = {'Content-Type': 'application/json'};

  factory API() {
    return _instance;
  }

  API._internal();

  Future getPokemons() async {
    var url = baseUrl + '/pokemons';
    if (cache.isNotEmpty) {
      return Future.value(List.of(cache.values));
    }
    try {
      var request = await http.get(url, headers: headers);
      Iterable list = json.decode(utf8.decode(request.bodyBytes));
      var pokemons = list.map((elt) => PokemonBasic.fromJson(elt)).toList();
      pokemons
          .forEach((pokemon) => cache.putIfAbsent(pokemon.id, () => pokemon));
      return Future.value(pokemons);
    } catch (e) {
      print(e);
    }
  }

  Future getPokemon(String name) async {
    var url = baseUrl + '/pokemon/' + name;
    try {
      var response = await http.get(url, headers: headers);
      return PokemonInfo.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } catch (e) {
      print(e);
    }
  }
}
