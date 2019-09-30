using System;

namespace PokeDex.Models
{
    public class Pokemon
    {
        public PokeName[] Names { get; set; }
        public PokeType[] Types { get; set; }
        public PokeInfo Information { get; set; }
        public string ImgUrl { get; set; }
    }
}
