import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/models/pokemon_basic.dart';
import 'package:pokedex/services/api.dart';
import 'package:pokedex/views/pokemon_detail.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final API api = new API();
  final ScrollController _scrollController =
      new ScrollController(keepScrollOffset: true);

  @override
  dispose() {
    super.dispose();
  }

  @override
  initState() {
    super.initState();
  }

  Card _buildCard(PokemonBasic pokemon) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: new Container(
        decoration: new BoxDecoration(
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
              String.fromCharCodes(pokemon.picture.codeUnits),
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            pokemon.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Image.asset(
                'assets/battle.png',
                width: 20,
                height: 20,
              ),

              Text(" "),
              //Icon(Icons.linear_scale, color: Colors.yellowAccent),
              Text(pokemon.attack.toString(),
                  style: TextStyle(color: Colors.white)),
              Text(" "),
              //Icon(Icons.linear_scale, color: Colors.yellowAccent),
              Image.asset(
                'assets/shield.png',
                width: 20,
                height: 20,
              ),
              Text(" "),
              Text(pokemon.defense.toString(),
                  style: TextStyle(color: Colors.white))
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => PokemonDetail(
                  name: pokemon.name,
                ), //PokemonDetail(pokemon: pokemon),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _body() {
    return new FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return new Container();
        }
        if (snapshot.hasData && snapshot.data != null) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) => _buildCard(snapshot.data[index]),
            controller: _scrollController,
          );
        } else {
          return new SpinKitDoubleBounce(
            color: Colors.white,
          );
        }
      },
      future: api.getAll(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            widget.title,
          ),
        ),
        body: _body(),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
    );
  }
}
