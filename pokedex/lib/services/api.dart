import 'package:http/http.dart' as http;

class API {
  static Future getPokemons() async {
    var url = 'http://192.168.1.24:8000/pokemons';
    try {
      return http.get(url);
    } catch (e) {
      print(e);
    }
  }

  static Future getPokemon(int id) async {
    var url = 'http://192.168.1.24:8000/pokemon/' + id.toString();
    try {
      return http.get(url);
    } catch (e) {
      print(e);
    }
  }
}
