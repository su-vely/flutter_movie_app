import 'package:flutter_movie_app/data/datasource/movie_datasource_impl.dart';
import 'package:flutter_movie_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_movie_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _movieRepositoryProvider =
    Provider((ref) => MovieRepositoryImpl(MovieDataSourceImpl()));

final movieDetailProvider =
    FutureProvider.family<MovieDetail?, int>((ref, id) async {
  final repo = ref.watch(_movieRepositoryProvider);
  return await FetchMovieDetail(repo).call(id);
});
