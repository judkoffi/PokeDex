package fr.pokedex.model;

abstract class AbstractPokemon {
  int id;
  String name;
  double attack;
  double defense;

  public AbstractPokemon(int id, String name, double attack, double defense) {
    this.id = id;
    this.name = name;
    this.attack = attack;
    this.defense = defense;
  }

}
