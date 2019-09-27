import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/api.dart';
import 'package:pokedex/views/pokemonprofile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pokemons = List<Pokemon>();
  void _getPokemons() {
    API.getPokemons().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        pokemons = list.map((elt) => Pokemon.fromJson(elt)).toList();
      });
    }).catchError((onError) => print(onError));
  }

  dispose() {
    super.dispose();
  }

  initState() {
    _getPokemons();
    super.initState();
  }

  Card buildCard(Pokemon pokemon) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, 0.9),
        ),
        child: new ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24),
              ),
            ),
            child: Image.network(
              pokemon.picture,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            pokemon.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.linear_scale, color: Colors.yellowAccent),
              Text(pokemon.pokemonInfos.weight,
                  style: TextStyle(color: Colors.white)),
              Text(" "),
              Icon(Icons.linear_scale, color: Colors.yellowAccent),
              Text(pokemon.pokemonInfos.height,
                  style: TextStyle(color: Colors.white))
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => PokemonProfile(pokemon: pokemon),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      body: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) => buildCard(pokemons[index]),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    );
  }
}
