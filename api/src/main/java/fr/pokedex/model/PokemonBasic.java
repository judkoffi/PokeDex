package fr.pokedex.model;

public class PokemonBasic extends AbstractPokemon {
  public String picture;

  public PokemonBasic(int id, String name, double attack, double defense, String picture) {
    super(id, name, attack, defense);
    this.picture = picture;
  }

  public double getAttack() {
    return attack;
  }

  public double getDefense() {
    return defense;
  }

  public String getName() {
    return name;
  }

  public int getId() {
    return id;
  }
}
