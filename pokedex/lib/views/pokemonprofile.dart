import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonProfile extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonProfile({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerContainer = new Container(
      child: new Container(
        child: new LinearProgressIndicator(
          backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
          value: 100,
          valueColor: new AlwaysStoppedAnimation(Colors.green),
        ),
      ),
    );

    final topContentText = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new SizedBox(height: 100.0),
        new Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        new SizedBox(height: 10.0),
        new Text(
          pokemon.name,
          style: new TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        new SizedBox(height: 30.0),
        new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[headerContainer],
        ),
      ],
    );

    final topContent = new Stack(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          child: new Image.network(pokemon.picture, fit: BoxFit.cover),
        ),
        new Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: new EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(color: Color.fromRGBO(58, 66, 86, 0.4)),
          child: new Center(
            child: topContentText,
          ),
        ),
        new Positioned(
          left: 8.0,
          top: 60.0,
          child: new InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: new Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = new Text(
      pokemon.name,
      style: new TextStyle(fontSize: 18.0, color: Colors.white),
    );

    final bottomContent = new Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      padding: new EdgeInsets.all(40.0),
      child: new Center(
        child: new Column(
          children: <Widget>[bottomContentText],
        ),
      ),
    );

    return new Scaffold(
      body: new Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
