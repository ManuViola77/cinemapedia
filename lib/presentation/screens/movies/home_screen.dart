import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    if (slideShowMovies.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppBar(),
          MoviesSlideShow(movies: slideShowMovies),
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'En Cines',
            subtitle: 'Lunes 20',
            loadNextPage:
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage,
          ),
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'Próximamente',
            subtitle: 'En este mes',
            loadNextPage:
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage,
          ),
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'Populares',
            loadNextPage:
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage,
          ),
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'Mejor Calificadas',
            subtitle: 'Desde siempre',
            loadNextPage:
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage,
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
