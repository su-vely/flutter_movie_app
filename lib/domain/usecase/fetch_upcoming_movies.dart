import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchUpcomingMovies {
  final MovieRepository repo;

  FetchUpcomingMovies(this.repo);

  Future<List<Movie>?> call() => repo.fetchUpcomingMovies();
}
