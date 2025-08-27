import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get baseUrl =>
      dotenv.env['TMDB_BASE_URL'] ?? 'https://api.themoviedb.org/3';
  static String get imageBase =>
      dotenv.env['TMDB_IMAGE_BASE'] ?? 'https://image.tmdb.org/t/p/w500';
  static String get token =>
      dotenv.env['TMDB_BEARER'] ?? '35830ce2a774fd6a2fbe293e96cf63db';
}
