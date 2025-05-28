import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorsMoviedbDatasourceImpl implements ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.theMovieDbUrl,
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': Environment.language,
      },
    ),
  );

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    final CreditsResponse creditsResponse = CreditsResponse.fromJson(
      response.data,
    );
    final List<Actor> actors =
        creditsResponse.cast
            .map((actor) => ActorsMapper.actorMovieDBToEntity(actor))
            .toList();

    return actors;
  }
}
