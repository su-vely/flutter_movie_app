import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchTopRatedMovies {
  final MovieRepository repo;

  FetchTopRatedMovies(this.repo);

  Future<List<Movie>?> call() => repo.fetchTopRatedMovies();
}
