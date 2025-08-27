import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchNowPlayingMovies {
  final MovieRepository repo;

  FetchNowPlayingMovies(this.repo);

  Future<List<Movie>?> call() => repo.fetchNowPlayingMovies();
}
