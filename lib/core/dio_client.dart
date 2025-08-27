import 'package:dio/dio.dart';
import 'package:flutter_movie_app/core/env.dart';

class DioClient {
  DioClient._();
  static final DioClient instance = DioClient._();

  late final Dio dio = Dio(
    BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      queryParameters: {
        'api_key': Env.apiKey,
      },
    ),
  );
}
