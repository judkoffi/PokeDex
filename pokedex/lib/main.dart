import 'package:flutter/material.dart';
import 'package:pokedex/views/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDex',
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'Pokedex'),
    );
  }
}
