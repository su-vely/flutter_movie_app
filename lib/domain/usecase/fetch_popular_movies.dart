import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchPopularMovies {
  final MovieRepository repo;

  FetchPopularMovies(this.repo);

  Future<List<Movie>?> call() => repo.fetchPopularMovies();
}
