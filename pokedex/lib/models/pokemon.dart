import 'package:pokedex/models/pokemoninfo.dart';
import 'package:pokedex/models/pokemontype.dart';

class Pokemon {
  int id;
  String name;
  String picture;
  String candy;
  String egg;
  double mutlipliers;
  List<PokemonType> weaknesses;
  PokemonInfo pokemonInfos;
  List<PokemonType> types;

  Pokemon(this.id, this.name, this.picture, this.candy, this.egg,
      this.mutlipliers, this.weaknesses, this.pokemonInfos, this.types);

  Iterable _buildTypes(Iterable types) {
    return types.map((value) => PokemonType.values.where(
        (e) => e.toString().toUpperCase() == value.toString().toUpperCase()));
  }

  Pokemon.fromJson(Map json) {
    this.id = json['id'];
    this.name = json['name'];
    this.candy = json['candy'];
    this.egg = json['egg'];
    this.picture = json['picture'];
    this.mutlipliers = json['multipliers'];
    this.pokemonInfos = new PokemonInfo(
        json['pokemonInfos']['height'],
        json['pokemonInfos']['weight'],
        json['pokemonInfos']['spawnChance'].toString(),
        json['pokemonInfos']['avgSpawns'].toString(),
        json['pokemonInfos']['spawnTime'].toString());
    /*this.types = new List<PokemonType>.from(
        _buildTypes(json['type']).map((elt) => elt).toList());
    this.weaknesses = new List<PokemonType>.from(
        _buildTypes(json['weaknesses']).map((elt) => elt).toList());
  */}
}
