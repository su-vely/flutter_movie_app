import 'package:flutter_movie_app/core/env.dart';
import 'package:flutter_movie_app/data/datasource/movie_datasource.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  String _fullPoster(String? path) {
    if (path == null || path.isEmpty) {
      return 'https://via.placeholder.com/120x180?text=No+Image';
    }
    return Env.posterUrl(path);
  }

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final dto = await dataSource.fetchNowPlayingMovies();
    return dto?.results
        ?.map((e) => Movie(id: e.id, posterPath: _fullPoster(e.posterPath)))
        .toList();
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    final dto = await dataSource.fetchPopularMovies();
    return dto?.results
        ?.map((e) => Movie(id: e.id, posterPath: _fullPoster(e.posterPath)))
        .toList();
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() async {
    final dto = await dataSource.fetchTopRatedMovies();
    return dto?.results
        ?.map((e) => Movie(id: e.id, posterPath: _fullPoster(e.posterPath)))
        .toList();
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() async {
    final dto = await dataSource.fetchUpcomingMovies();
    return dto?.results
        ?.map((e) => Movie(id: e.id, posterPath: _fullPoster(e.posterPath)))
        .toList();
  }

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final d = await dataSource.fetchMovieDetail(id);
    if (d == null) return null;
    return MovieDetail(
      id: d.id,
      title: d.title ?? '제목 없음',
      overview: d.overview ?? '줄거리 없음',
      tagline: d.tagline ?? '',
      releaseDate: (d.releaseDate != null && d.releaseDate!.isNotEmpty)
          ? DateTime.tryParse(d.releaseDate!)
          : null,
      runtime: d.runtime ?? 0,
      budget: d.budget ?? 0,
      revenue: d.revenue ?? 0,
      popularity: d.popularity ?? 0,
      voteAverage: d.voteAverage ?? 0,
      voteCount: d.voteCount ?? 0,
      genres: (d.genres ?? []).map((g) => g.name ?? '').toList(),
      productionCompanyLogos: (d.productionCompanies ?? [])
          .map((c) => c.logoPath != null
              ? Env.posterUrl(c.logoPath!, size: 'w185')
              : '')
          .where((e) => e.isNotEmpty)
          .toList(),
    );
  }
}
