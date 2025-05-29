import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    super.initState();
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext currentContext) {
    final Map<int, Movie> favoriteMoviesMap = ref.watch(favoriteMoviesProvider);
    final List<Movie> favoriteMoviesList = favoriteMoviesMap.values.toList();

    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteMoviesList.length,
        itemBuilder: (context, index) {
          final movie = favoriteMoviesList[index];
          return ListTile(title: Text(movie.title));
        },
      ),
    );
  }
}
