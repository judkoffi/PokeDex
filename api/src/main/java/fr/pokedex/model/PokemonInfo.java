package fr.pokedex.model;

import java.util.List;
import java.util.Map;
import org.bson.types.ObjectId;

public class PokemonInfo extends AbstractPokemon {

  public enum POKEMONTYPES {
    NORMAL, FIRE, FIGHTING, WATER, FLYING, GRASS, POISON, ELECTRIC, GROUND, PSYCHIC, ROCK, ICE, BUG, DRAGON, GHOST, DARK, STEEL, FAIRY, UNKNOWN
  }

  public ObjectId _id;
  public double total;
  public Map<String, String> sprites;
  public double speed;
  public List<POKEMONTYPES> type;

  public PokemonInfo(double total, int id, String name, Map<String, String> sprites, double attack,
      double defense, double speed, List<POKEMONTYPES> type) {
    super(id, name, attack, defense);
    this.total = total;
    this.id = id;
    this.name = name;
    this.sprites = sprites;
    this.attack = attack;
    this.defense = defense;
    this.speed = speed;
    this.type = type;
  }

  public double getTotal() {
    return total;
  }

  public int getId() {
    return id;
  }

  public String getName() {
    return name;
  }

  public Map<String, String> getSprites() {
    return sprites;
  }

  public double getAttack() {
    return attack;
  }

  public double getDefense() {
    return defense;
  }

  public double getSpeed() {
    return speed;
  }

  public List<POKEMONTYPES> getType() {
    return type;
  }

}
