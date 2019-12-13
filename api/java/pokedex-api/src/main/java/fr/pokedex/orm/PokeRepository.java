package fr.pokedex.orm;

import java.util.List;
import java.util.stream.Collectors;
import javax.enterprise.context.ApplicationScoped;
import fr.pokedex.model.Pokemon;
import io.quarkus.mongodb.panache.PanacheMongoRepository;

@ApplicationScoped
public class PokeRepository implements PanacheMongoRepository<PokemonEntity> {

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
    pokemon.height = pokemon.height;
    pokemon.weight = entity.weight;
    pokemon.type = entity.type;
    pokemon.weakness = entity.weakness;
    return pokemon;
  }

  public List<Pokemon> getAll() {
    return findAll().stream().map(PokeRepository::entityToModel).collect(Collectors.toList());
  }

  public Pokemon findOne(String id) {
    return entityToModel(find("id = ?1", Integer.parseInt(id)).firstResult());
  }

}
