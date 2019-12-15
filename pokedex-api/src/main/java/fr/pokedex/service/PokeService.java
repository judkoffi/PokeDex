package fr.pokedex.service;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import fr.pokedex.model.Pokemon;
import fr.pokedex.model.Pokemon.POKEMONTYPES;
import fr.pokedex.orm.PokeRepository;
import fr.pokedex.orm.PokemonEntity;

@ApplicationScoped
public class PokeService {
  @Inject
  PokeRepository repository;

  private final HashMap<Integer, Pokemon> cache;

  public PokeService() {
    this.cache = new HashMap<>();
  }

  private static <T extends Enum<T>> T getEnumFromString(Class<T> declaringClass, String str) {
    if (declaringClass != null && str != null) {
      try {
        return Enum.valueOf(declaringClass, str.trim().toUpperCase());
      } catch (IllegalArgumentException e) {
        throw new AssertionError(e);
      }
    }
    return null;
  }

  private static POKEMONTYPES fromString(String name) {
    return getEnumFromString(POKEMONTYPES.class, name);
  }

  private static Pokemon entityToModel(PokemonEntity entity) {
    var id = entity.id;
    var name = entity.name;
    var num = entity.num;
    var img = entity.img;
    var avgSpawns = entity.avgSpawns;
    var candy = entity.candy;
    var spawn = entity.spawn;
    var spawnTime = entity.spawnTime;
    var egg = entity.egg;
    var height = entity.height;
    var weight = entity.weight;
    var type = entity//
        .type//
          .stream()
          .map(PokeService::fromString)
          .collect(Collectors.toList());
    var weakness = entity.//
        weaknesses//
          .stream()
          .map(PokeService::fromString)
          .collect(Collectors.toList());

    return new Pokemon(id, name, img, num, spawn, avgSpawns, spawnTime, height, weight, candy, egg,
        type, weakness);
  }

  public List<Pokemon> getAll() {
    return repository
      .findAll()
      .stream()
      .map(PokeService::entityToModel)
      .collect(Collectors.toList());
  }

  public Pokemon findOne(String id) {
    var key = Integer.parseInt(id);
    if (cache.containsKey(key))
      return cache.get(key);

    var pokemon = entityToModel(repository.find("id = ?1", key).firstResult());
    cache.put(key, pokemon);
    return pokemon;
  }
}
