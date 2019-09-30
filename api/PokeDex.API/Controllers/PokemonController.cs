using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PokeDex.Models;

namespace PokeDex.API
{
    [Route("api/[controller]")]
    [ApiController]
    public class PokemonController: ControllerBase
    {
        public PokemonController(){

        }


         [HttpGet("pokemons")]
        public ActionResult<IEnumerable<Pokemon>> Pokemons()
        {
          return null;
        }
    }
}