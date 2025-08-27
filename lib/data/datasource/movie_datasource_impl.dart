import 'package:dio/dio.dart';
import 'package:flutter_movie_app/core/constants.dart';
import 'package:flutter_movie_app/core/dio_client.dart';
import 'package:flutter_movie_app/data/datasource/movie_datasource.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final Dio _dio = DioClient.instance.dio;

  @override
  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    try {
      final res = await _dio.get(
        Constants.nowPlaying,
        queryParameters: {'language': 'ko-KR', 'page': 1},
      );
      return MovieResponseDto.fromJson(res.data);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchPopularMovies() async {
    try {
      final res = await _dio.get(
        Constants.popular,
        queryParameters: {'language': 'ko-KR', 'page': 1},
      );
      return MovieResponseDto.fromJson(res.data);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() async {
    try {
      final res = await _dio.get(
        Constants.topRated,
        queryParameters: {'language': 'ko-KR', 'page': 1},
      );
      return MovieResponseDto.fromJson(res.data);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() async {
    try {
      final res = await _dio.get(
        Constants.upcoming,
        queryParameters: {'language': 'ko-KR', 'page': 1},
      );
      return MovieResponseDto.fromJson(res.data);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    try {
      final res = await _dio.get(
        Constants.detail(id),
        queryParameters: {'language': 'ko-KR'},
      );
      return MovieDetailDto.fromJson(res.data);
    } catch (_) {
      return null;
    }
  }
}
