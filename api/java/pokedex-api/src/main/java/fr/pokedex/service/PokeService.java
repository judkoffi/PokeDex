package fr.pokedex.service;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import fr.pokedex.model.Pokemon;
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

  private static Pokemon entityToModel(PokemonEntity entity) {
    var pokemon = new Pokemon();
    pokemon.id = entity.id;
    pokemon.name = entity.name;
    pokemon.num = entity.num;
    pokemon.img = entity.img;
    pokemon.avgSpawns = entity.avgSpawns;
    pokemon.candy = entity.candy;
    pokemon.spawn = entity.spawn;
    pokemon.spawnTime = entity.spawnTime;
    pokemon.egg = entity.egg;
    pokemon.height = entity.height;
    pokemon.weight = entity.weight;
    pokemon.type = entity.type;
    pokemon.weakness = entity.weakness;
    return pokemon;
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
