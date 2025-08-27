import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/detail/detail_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final int id;
  final String posterUrl;
  const DetailPage({super.key, required this.id, required this.posterUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(movieDetailProvider(id));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 320,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'poster_$id',
                child: Image.network(
                  posterUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Container(color: Colors.grey.shade800),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: state.when(
              data: (d) {
                if (d == null) {
                  return const Padding(
                      padding: EdgeInsets.all(20), child: Text('상세 정보 없음'));
                }
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(d.title,
                          style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 4),
                      Text(
                        d.releaseDate != null
                            ? '개봉: ${d.releaseDate!.toString().split(' ').first}'
                            : '개봉 정보 없음',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      if (d.tagline.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(d.tagline,
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text('러닝타임: ${d.runtime}분'),
                          const SizedBox(width: 12),
                          Flexible(child: Text('카테고리: ${d.genres.join(', ')}')),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text('영화설명',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 6),
                      Text(d.overview.isEmpty ? '설명 없음' : d.overview),
                      const SizedBox(height: 16),
                      Text('흥행정보',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _StatCard(
                                label: '평점',
                                value: d.voteAverage.toStringAsFixed(1)),
                            _StatCard(
                                label: '투표수', value: d.voteCount.toString()),
                            _StatCard(
                                label: '인기',
                                value: d.popularity.toStringAsFixed(0)),
                            _StatCard(label: '예산', value: d.budget.toString()),
                            _StatCard(label: '수익', value: d.revenue.toString()),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text('제작사',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: d.productionCompanyLogos.length,
                          itemBuilder: (context, index) {
                            final logo = d.productionCompanyLogos[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.network(
                                logo,
                                fit: BoxFit.contain,
                                color: Colors.white,
                                errorBuilder: (_, __, ___) => Container(
                                    width: 60, color: Colors.grey.shade800),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (err, stack) => const Center(child: Text('오류가 발생했습니다.')),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 4),
            Text(value, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
