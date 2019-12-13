const { POKEMONTYPES, PokemonInfo, Pokemon } = require('../models/pokemon');

const fs = require('fs');

let rawData = fs.readFileSync('./assets/pokemons.json');
let parsedData = JSON.parse(rawData).pokemon;

function ToPokemon(elt) {
    var details = new PokemonInfo(elt.height, elt.weight, elt.spawn_chance, elt.avg_spawns, elt.spawn_time);
    let pokemon = new Pokemon(elt.id, elt.name, elt.img, elt.type, elt.candy, elt.egg, details, elt.multipliers, elt.weaknesses);
    return pokemon;
}

let dictionnary = new Map();
parsedData.map((elt) => dictionnary.set(elt.id, ToPokemon(elt)));

function getPokemons() {
    let pokemons = [];
    dictionnary.forEach((entry) => pokemons.push(entry));
    return pokemons;
}

function findPokemon(id) {
    return dictionnary.get(parseInt(id));
}

module.exports = {
    getPokemons,
    findPokemon
}