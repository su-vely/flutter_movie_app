import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get apiKey => dotenv.get('TMDB_API_KEY', fallback: '');
  static String get baseUrl => dotenv.get('TMDB_BASE_URL', fallback: '');
  static String get imageBase => dotenv.get('IMAGE_BASE_URL', fallback: '');

  static String posterUrl(String? path, {String size = 'w500'}) {
    if (path == null || path.isEmpty) return '';
    return '$imageBase/$size$path';
  }
}
