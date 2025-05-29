import 'package:cinemapedia/presentation/widgets/widgets.dart';
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
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;

    setState(() {
      isLoading = true;
    });

    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();

    setState(() {
      if (movies.isEmpty) {
        isLastPage = true;
      }

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext currentContext) {
    final Map<int, Movie> favoriteMoviesMap = ref.watch(favoriteMoviesProvider);
    final List<Movie> favoriteMoviesList = favoriteMoviesMap.values.toList();

    return Scaffold(
      body: MovieMasonry(
        movies: favoriteMoviesList,
        loadNextPage: loadNextPage,
      ),
    );
  }
}
