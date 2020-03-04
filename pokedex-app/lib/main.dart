import 'package:flutter/material.dart';
import 'package:pokedex/views/home_page.dart';
import 'package:global_configuration/global_configuration.dart';

void main() async {
  try {
    await GlobalConfiguration().loadFromAsset("app_settings.json");
  } catch (e) {
    final Map<String, String> appSettings = {
      "API_BASE_URL": "http://vps743774.ovh.net:8080/v1",
      "ICONS_URL": "http://vps743774.ovh.net:8080/icons"
    };
    GlobalConfiguration().loadFromMap(appSettings);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color _color = Color.fromARGB(255, 16, 88, 102);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDex',
      theme: new ThemeData(
        primaryColor: _color,
      ),
      debugShowCheckedModeBanner: false,
      home: new HomePage(title: 'Pokedex'),
    );
  }
}
