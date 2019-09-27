const ServerConfiguration = require('./helpers/serverConfiguration');
const databse = require('./helpers/databaseMock');

const express = require('express');
const app = express();

let serverConfig = new ServerConfiguration('localhost', 8000);

app.get('/', (req, res) => res.send(''));

app.get('/pokemons', (req, res) => {
	console.log("all");
	let data = databse.getPokemons();
	res.set('Accept', 'application/json');
	res.json(data);
});

app.get('/pokemon/:id', (req, res) => {
	let id = req.params.id;
	let data = databse.findPokemon(id);
	console.log("single");
	res.set('Accept', 'application/json');
	res.json(data);
});

app.listen(serverConfig.port, serverConfig.host, () => console.log(serverConfig.toString()));
