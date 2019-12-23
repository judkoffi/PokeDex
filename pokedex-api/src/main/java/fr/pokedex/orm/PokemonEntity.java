package fr.pokedex.orm;

import java.util.List;
import java.util.Map;
import org.bson.codecs.pojo.annotations.BsonProperty;
import org.bson.types.ObjectId;
import io.quarkus.mongodb.panache.MongoEntity;
import io.quarkus.mongodb.panache.PanacheMongoEntity;


@MongoEntity(collection = "pokedex")
public class PokemonEntity extends PanacheMongoEntity {
  
  @BsonProperty("_id")
  public ObjectId _id;
  public double total;
  @BsonProperty("national_number")
  public String id;
  public String name;
  public Map<String, String> sprites;
  public List<String> type;
  public double attack;
  public double defense;
  public double speed;  
  
}
