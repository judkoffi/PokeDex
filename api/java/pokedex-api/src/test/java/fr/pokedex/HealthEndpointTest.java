package fr.pokedex;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import org.junit.jupiter.api.Test;
import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
public class HealthEndpointTest {
  @Test
  public void testHelloEndpoint() {
    given().when().get("/health").then().statusCode(200).body(is("yao"));
  }
}
