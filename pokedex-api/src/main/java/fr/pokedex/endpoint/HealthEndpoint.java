package fr.pokedex.endpoint;

import javax.enterprise.context.ApplicationScoped;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/api")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)

@ApplicationScoped
public class HealthEndpoint {

  @GET
  @Path("/health")
  public Response pokemons() {
    return Response.ok().entity("yao").build();
  }

}
