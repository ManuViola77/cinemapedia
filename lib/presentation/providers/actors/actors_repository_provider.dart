import 'package:cinemapedia/infrastructure/datasources/actors_moviedb_datasource_impl.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// este repositorio es inmutable, solo de lectura
final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorsMoviedbDatasourceImpl());
});
