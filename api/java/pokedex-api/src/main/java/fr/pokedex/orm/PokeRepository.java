package fr.pokedex.orm;

import javax.enterprise.context.ApplicationScoped;
import io.quarkus.mongodb.panache.PanacheMongoRepository;

@ApplicationScoped
public class PokeRepository implements PanacheMongoRepository<PokemonEntity> {

}
