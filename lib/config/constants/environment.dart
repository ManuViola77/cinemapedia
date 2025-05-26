import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String language = 'es-MX';
  static String theMovieDbUrl = dotenv.env['THE_MOVIEDB_URL'] ?? 'No hay url';
  static String theMovieDbKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api Key';
}
