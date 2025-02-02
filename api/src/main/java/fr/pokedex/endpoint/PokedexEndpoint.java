package fr.pokedex.endpoint;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.jboss.resteasy.annotations.jaxrs.PathParam;
import fr.pokedex.service.PokeService;

@Path("/v1")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class PokedexEndpoint {

  @Inject
  PokeService service;

  @GET
  @Path("/pokemons")
  public Response pokemons() {
    var pokemons = service.getAll();
    return Response.ok().entity(pokemons).build();
  }

  private boolean checkIdParam(String name) {
    return !name.isBlank() && !name.isEmpty();
  }

  @GET
  @Path("/pokemon/{id}")
  public Response pokemon(@PathParam String id) {
    if (!checkIdParam(id))
      return Response.status(400).build();

    var pokemon = service.find(id);
    return Response.ok().entity(pokemon).build();
  }

}
