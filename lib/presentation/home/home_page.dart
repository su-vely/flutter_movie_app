import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/detail/detail_page.dart';
import 'package:flutter_movie_app/presentation/home/home_viewmodel.dart';
import 'package:flutter_movie_app/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlayingMoviesAsync = ref.watch(nowPlayingMoviesProvider);
    final popularMoviesAsync = ref.watch(popularMoviesProvider);
    final topRatedMoviesAsync = ref.watch(topRatedMoviesProvider);
    final upcomingMoviesAsync = ref.watch(upcomingMoviesProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '가장 인기있는',
                style: TextStyle(fontSize: 21),
              ),
            ),
            SizedBox(height: 10),
            if (popularMoviesAsync.value != null) ...[
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      Movie m = popularMoviesAsync.value!.first;
                      return DetailPage(id: m.id, posterUrl: m.posterPath);
                    },
                  ));
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(20),
                        child: Image.network(
                            popularMoviesAsync.value!.first.posterPath))),
              )
            ],
            _buildSection(
              context,
              '현재 상영중',
              nowPlayingMoviesAsync.value,
              nowPlayingMoviesAsync.isLoading,
            ),
            _buildSection(
              context,
              '인기순',
              popularMoviesAsync.value,
              popularMoviesAsync.isLoading,
              showRanking: true,
            ),
            _buildSection(
              context,
              '평점 높은순',
              topRatedMoviesAsync.value,
              topRatedMoviesAsync.isLoading,
            ),
            _buildSection(
              context,
              '개봉 예정',
              upcomingMoviesAsync.value,
              upcomingMoviesAsync.isLoading,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Movie>? movies,
    bool isLoading, {
    bool showRanking = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        if (isLoading)
          const Center(child: CircularProgressIndicator())
        else if (movies == null || movies.isEmpty)
          const Center(child: Text('영화 정보가 없습니다.'))
        else
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(
                            '${Routes.detail}/${movie.id}',
                            extra: movie.posterPath,
                          );
                        },
                        child: Hero(
                          tag: 'poster_${movie.id}',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              movie.posterPath.isEmpty
                                  ? 'https://via.placeholder.com/120x180?text=No+Image'
                                  : movie.posterPath,
                              fit: BoxFit.cover,
                              height: 180,
                              width: 120,
                              errorBuilder: (_, __, ___) => Container(
                                color: Colors.grey.shade800,
                                height: 180,
                                width: 120,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (showRanking)
                        Positioned(
                          bottom: 4,
                          left: 4,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '${index + 1}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
