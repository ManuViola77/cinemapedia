import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: const FlexibleSpaceBar(title: CustomAppBar()),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MoviesSlideShow(movies: slideShowMovies),
                MovieHorizontalListView(
                  movies: nowPlayingMovies,
                  title: 'En Cines',
                  subtitle: 'Lunes 20',
                  loadNextPage:
                      ref.read(nowPlayingMoviesProvider.notifier).loadNextPage,
                ),
                MovieHorizontalListView(
                  movies: upcomingMovies,
                  title: 'Próximamente',
                  subtitle: 'En este mes',
                  loadNextPage:
                      ref.read(upcomingMoviesProvider.notifier).loadNextPage,
                ),
                MovieHorizontalListView(
                  movies: popularMovies,
                  title: 'Populares',
                  loadNextPage:
                      ref.read(popularMoviesProvider.notifier).loadNextPage,
                ),
                MovieHorizontalListView(
                  movies: topRatedMovies,
                  title: 'Mejor Calificadas',
                  subtitle: 'Desde siempre',
                  loadNextPage:
                      ref.read(topRatedMoviesProvider.notifier).loadNextPage,
                ),
                const SizedBox(height: 25),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
