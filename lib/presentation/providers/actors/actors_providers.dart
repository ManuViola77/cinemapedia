import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsNotifier, Map<String, List<Actor>>>((ref) {
      final getActorsByMovieId =
          ref.watch(actorRepositoryProvider).getActorsByMovieId;
      return ActorsNotifier(getActorsByMovieId: getActorsByMovieId);
    });

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsNotifier extends StateNotifier<Map<String, List<Actor>>> {
  GetActorsCallback getActorsByMovieId;

  ActorsNotifier({required this.getActorsByMovieId}) : super({});

  Future<void> loadActorsByMovieId(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActorsByMovieId(movieId);
    state = {...state, movieId: actors};
  }
}
