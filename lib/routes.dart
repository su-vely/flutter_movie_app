import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/detail/detail_page.dart';
import 'package:flutter_movie_app/presentation/home/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/detail/:id',
      builder: (BuildContext context, GoRouterState state) {
        final id = int.parse(state.pathParameters['id']!);
        final posterUrl = state.extra as String;
        return DetailPage(id: id, posterUrl: posterUrl);
      },
    ),
  ],
);

class Routes {
  static const home = '/';
  static const detail = '/detail';
}
