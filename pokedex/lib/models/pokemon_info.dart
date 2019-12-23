import 'package:enum_to_string/enum_to_string.dart';
import 'package:pokedex/models/pokemon_type.dart';

class PokemonInfo {
  double total;
  int id;
  String name;
  Map<String, String> sprites;
  List<PokemonType> types;
  double attack;
  double defense;
  double speed;

  PokemonInfo(this.id, this.name, this.sprites, this.types, this.attack,
      this.defense, this.speed);

  PokemonInfo.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.attack = json['attack'];
    this.defense = json['defense'];
    this.speed = json['speed'];
    this.sprites = Map.from(json['sprites']);
    this.types = List.of(json['type'])
        .map((type) => EnumToString.fromString(PokemonType.values, type))
        .toList();
  }

  @override
  bool operator ==(o) => o is PokemonInfo && name == o.name && id == o.id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
