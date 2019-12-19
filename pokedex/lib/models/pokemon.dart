import 'package:enum_to_string/enum_to_string.dart';
import 'package:pokedex/models/pokemoninfo.dart';
import 'package:pokedex/models/pokemontype.dart';

class Pokemon {
  double total;
  int id;
  String name;
  Map<String, String> sprites;
  List<PokemonType> types;
  double attack;
  double defense;
  double speed;

  Pokemon(this.id, this.name, this.sprites, this.types, this.attack,
      this.defense, this.speed);

  Pokemon.fromJson(Map json) {
    this.id = json['id'];
    this.name = json['name'];
    this.attack = json['attack'];
    this.defense = json['defense'];
    this.speed = json['speed'];
    this.sprites = json['sprites'];
    this.types = List.of(json['type'])
        .map((type) => EnumToString.fromString(PokemonType.values, type))
        .toList();
  }

  @override
  bool operator ==(o) => o is Pokemon && name == o.name && id == o.id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
