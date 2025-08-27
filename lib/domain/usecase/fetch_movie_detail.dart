import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchMovieDetail {
  final MovieRepository repo;

  FetchMovieDetail(this.repo);

  Future<MovieDetail?> call(int id) => repo.fetchMovieDetail(id);
}
