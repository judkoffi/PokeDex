package fr.pokedex.orm;

import java.util.List;
import org.bson.codecs.pojo.annotations.BsonProperty;
import org.bson.types.ObjectId;
import io.quarkus.mongodb.panache.MongoEntity;
import io.quarkus.mongodb.panache.PanacheMongoEntity;

@MongoEntity(collection = "pokedex")
public class PokemonEntity extends PanacheMongoEntity {
  
  @BsonProperty("_id")
  public ObjectId _id;
  @BsonProperty("spawn_chance")
  public double spawn;
  @BsonProperty("avg_spawns")
  public double avgSpawns;
  @BsonProperty("spawn_time")
  public String spawnTime;
  public int id;
  public String name;
  public String img;
  public String num;
  public List<String> type;
  public String height;
  public String weight;
  public String candy;
  public String egg;
  public List<String> weaknesses;

  @Override
  public String toString() {
    return "PokemonEntity [_id=" + _id + ", spawn=" + spawn + ", avgSpawns=" + avgSpawns
        + ", spawnTime=" + spawnTime + ", id=" + id + ", name=" + name + ", img=" + img + ", num="
        + num + ", type=" + type + ", height=" + height + ", weight=" + weight + ", candy=" + candy
        + ", egg=" + egg + ", weaknessess=" + weaknesses + "]";
  }

  public PokemonEntity() {}
}
