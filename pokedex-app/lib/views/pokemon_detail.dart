import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:pokedex/models/pokemon_info.dart';
import 'package:pokedex/services/api.dart';

class PokemonDetail extends StatelessWidget {
  PokemonDetail({Key key, this.title, this.name}) : super(key: key);
  final String title;
  final String name;
  static final String baseUrlIcons =
      GlobalConfiguration().getString("ICONS_URL");

  final api = new API();
  final Color _color = Color.fromARGB(255, 16, 88, 102);

  Column _buildProfile(PokemonInfo pokemon, BuildContext context) {
    final pictureFrame = new Stack(
      children: <Widget>[
        new Container(
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
          padding: new EdgeInsets.only(
            left: 5.0,
          ),
          height: MediaQuery.of(context).size.height * 0.35,
          child: Image.network(
            pokemon.sprites["animated"],
            fit: BoxFit.cover,
          ),
        ),
      ],
    );

    var widgets = pokemon.types
        .map(
          (type) => new DecoratedBox(
            decoration: new BoxDecoration(
              border: new Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Image.network(
              '$baseUrlIcons/${(type.toString().split('.')[1]).toLowerCase()}.png',
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();

    for (var i = 0; i < widgets.length; i++) {
      if ((i % 2) != 0) {
        widgets.insert(
          1,
          new DecoratedBox(
            decoration: new BoxDecoration(
              border: new Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(
                5.0,
              ),
            ),
            child: new SizedBox(
              width: 10,
            ),
          ),
        );
      }
    }

    final middleFrame = new Container(
      width: MediaQuery.of(context).size.width,
      color: _color,
      child: new ListTile(
        leading: new Container(
          padding: EdgeInsets.only(
            right: 12.0,
          ),
          decoration: new BoxDecoration(
            border: new Border(
              right: new BorderSide(
                width: 3.0,
                color: Colors.black,
              ),
            ),
          ),
          child: new Text(
            pokemon.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        title: new Row(
          children: widgets,
        ),
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

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        body: new FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return new Container();
            }
            if (snapshot.hasData && snapshot.data != null) {
              return _buildProfile(snapshot.data, context);
            } else {
              return new SpinKitWave(
                color: Color.fromRGBO(64, 75, 96, 0.9),
              );
            }
          },
          future: api.getPokemon(name),
        ),
      ),
    );
  }
}
