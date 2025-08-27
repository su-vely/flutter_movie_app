import 'package:flutter_movie_app/data/datasource/movie_datasource_impl.dart';
import 'package:flutter_movie_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_now_playing_movies.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_popular_movies.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_top_rated_movies.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_upcoming_movies.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _movieRepositoryProvider =
    Provider((ref) => MovieRepositoryImpl(MovieDataSourceImpl()));

final nowPlayingMoviesProvider = FutureProvider<List<Movie>?>((ref) async {
  final repo = ref.watch(_movieRepositoryProvider);
  return await FetchNowPlayingMovies(repo).call();
});

final popularMoviesProvider = FutureProvider<List<Movie>?>((ref) async {
  final repo = ref.watch(_movieRepositoryProvider);
  final movies = await FetchPopularMovies(repo).call();

  return movies
      ?.map((m) => Movie(
          id: m.id,
          posterPath: m.posterPath.isEmpty
              ? 'https://via.placeholder.com/120x180?text=No+Image'
              : m.posterPath))
      .toList();
});

final topRatedMoviesProvider = FutureProvider<List<Movie>?>((ref) async {
  final repo = ref.watch(_movieRepositoryProvider);
  return await FetchTopRatedMovies(repo).call();
});

final upcomingMoviesProvider = FutureProvider<List<Movie>?>((ref) async {
  final repo = ref.watch(_movieRepositoryProvider);
  return await FetchUpcomingMovies(repo).call();
});
