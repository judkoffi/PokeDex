const POKEMONTYPES = {
    NORMAL: 'Normal',
    FIRE: 'Fire',
    FIGTHING: 'Fighting',
    WATER: 'Water',
    FLYING: 'Flying',
    GRASS: 'Grass',
    POISON: 'Poison',
    ELECTRIC: 'Electric',
    GROUND: 'Ground',
    PSYCHIC: 'Psychic',
    ROCK: 'Rock',
    ICE: 'Ice',
    BUG: 'Bug',
    DRAGON: 'Dragon',
    GHOST: 'Ghost',
    DARK: 'Dark',
    STEEL: 'Steel',
    FAIRRY: 'Fairy',
    UNKNOWN: '???'
};

class PokemonInfo {
    constructor(height, weight, spawnChance, avgSpawns, spawnTime) {
        this.height = height;
        this.weight = weight;
        this.spawnChance = spawnChance;
        this.avgSpawns = avgSpawns;
        this.spawnTime = spawnTime;
    }
}

class Pokemon {
    constructor(id, name, img, type, candy, egg, pokemonInfos, mutlipliers, weaknesses) {
        this.id = id;
        this.name = name;
        this.picture = img;
        this.type = type;
        this.candy = candy;
        this.egg = egg;
        this.pokemonInfos = pokemonInfos;
        this.mutlipliers = mutlipliers;
        this.weaknesses = weaknesses;
    }
}

module.exports = {
    POKEMONTYPES,
    PokemonInfo,
    Pokemon
}