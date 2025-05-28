import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorsMapper {
  static Actor actorMovieDBToEntity(Cast actorCast) => Actor(
    id: actorCast.id.toString(),
    name: actorCast.name,
    profilePath:
        actorCast.profilePath != ''
            ? '${Environment.imageUrl}${actorCast.profilePath}'
            : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
    character: actorCast.character,
  );
}
