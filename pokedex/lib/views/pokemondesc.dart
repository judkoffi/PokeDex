import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/api.dart';

class PokemonDesc extends StatelessWidget {
  PokemonDesc({Key key, this.title, this.id}) : super(key: key);
  final String title;
  final int id;
  static final String baseUrl = 'http://vps743774.ovh.net:8080/icons';
  final api = new API();

  Column _buildProfile(Pokemon pokemon, BuildContext context) {
    final pictureFrame = new Stack(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          child: Image.network(
            pokemon.sprites["large"],
            fit: BoxFit.cover,
          ),
        ),
        new Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: new EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            color: Color.fromRGBO(58, 66, 86, 0.4),
          ),
        ),
        new Positioned(
          left: 8.0,
          top: 60.0,
          child: new InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: new Icon(Icons.arrow_back, color: Colors.grey),
          ),
        )
      ],
    );

    final pictureAnimatedFrame = new Stack(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(left: 15.0),
          height: MediaQuery.of(context).size.height * 0.3,
          child: Image.network(
            pokemon.sprites["animated"],
            fit: BoxFit.cover,
          ),
        ),
      ],
    );

    final middleFrame = new Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      padding: new EdgeInsets.all(20.0),
      child: new Row(
        children: <Widget>[
          new Text(
            pokemon.name,
            style: new TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          new VerticalDivider(
            color: Colors.green,
            width: 20,
          ),
          new Row(
            children: pokemon.types
                .map(
                  (type) => new DecoratedBox(
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Image.network(
                      baseUrl +
                          '/' +
                          (type.toString().split('.')[1]).toLowerCase() +
                          '.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );

    return new Column(
      children: <Widget>[
        pictureFrame,
        middleFrame,
        pictureAnimatedFrame,
      ],
    );
  }

  Widget _body() {
    return new FutureBuilder(
      builder: (context, future) {
        switch (future.connectionState) {
          case ConnectionState.waiting:
            return new SpinKitDoubleBounce(
              color: Colors.white,
            );
          case ConnectionState.none:
            return new Container(
              child: Text("no data"),
              color: Colors.white,
            );
          default:
            return _buildProfile(future.data, context);
        }
      },
      future: api.getPokemon(id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        body: _body(),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
    );
  }
}
