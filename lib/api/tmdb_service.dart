import 'package:dio/dio.dart';
import '../core/env_config.dart';

class TMDBService {
  final Dio dio = Dio();

  Future<List<dynamic>> fetchPopularMovies() async {
    final response = await dio.get(
      '${EnvConfig.baseUrl}/movie/popular',
      queryParameters: {'language': 'ko-KR', 'page': 1},
      options: Options(
        headers: {
          'Authorization': 'Bearer ${EnvConfig.token}',
        },
      ),
    );

    return response.data['results'] as List<dynamic>;
  }
}
