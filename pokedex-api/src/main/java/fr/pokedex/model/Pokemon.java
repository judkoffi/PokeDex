package fr.pokedex.model;

import java.util.List;

public class Pokemon {
  private final int id;
  private final String name;
  private final String img;
  private final String num;
  private final double spawn;
  private final double avgSpawns;
  private final String spawnTime;
  private final String height;
  private final String weight;
  private final String candy;
  private final String egg;
  private final List<POKEMONTYPES> type;
  private final List<POKEMONTYPES> weakness;

  public Pokemon(int id, String name, String img, String num, double spawn, double avgSpawns,
      String spawnTime, String height, String weight, String candy, String egg,
      List<POKEMONTYPES> type, List<POKEMONTYPES> weakness) {
    this.id = id;
    this.name = name;
    this.img = img;
    this.num = num;
    this.spawn = spawn;
    this.avgSpawns = avgSpawns;
    this.spawnTime = spawnTime;
    this.height = height;
    this.weight = weight;
    this.candy = candy;
    this.egg = egg;
    this.type = type;
    this.weakness = weakness;
  }

  public enum POKEMONTYPES {
    NORMAL, FIRE, FIGHTING, WATER, FLYING, GRASS, POISON, ELECTRIC, GROUND, PSYCHIC, ROCK, ICE, BUG, DRAGON, GHOST, DARK, STEEL, FAIRY, UNKNOWN
  }


  public String getName() {
    return name;
  }


  public int getId() {
    return id;
  }


  public String getImg() {
    return img;
  }


  public String getNum() {
    return num;
  }


  public double getSpawn() {
    return spawn;
  }


  public double getAvgSpawns() {
    return avgSpawns;
  }


  public String getSpawnTime() {
    return spawnTime;
  }


  public String getHeight() {
    return height;
  }


  public String getWeight() {
    return weight;
  }


  public String getCandy() {
    return candy;
  }


  public String getEgg() {
    return egg;
  }


  public List<POKEMONTYPES> getType() {
    return type;
  }


  public List<POKEMONTYPES> getWeakness() {
    return weakness;
  }

}
