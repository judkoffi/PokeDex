class PokemonBasic {
  int id;
  String name;
  String picture;
  double attack;
  double defense;

  PokemonBasic(this.id, this.name, this.attack, this.defense, this.picture);

  PokemonBasic.fromJson(Map json) {
    this.id = json['id'];
    this.name = json['name'];
    this.attack = json['attack'];
    this.defense = json['defense'];
    this.picture = json['picture'];
  }

  @override
  bool operator ==(o) => o is PokemonBasic && name == o.name && id == o.id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
