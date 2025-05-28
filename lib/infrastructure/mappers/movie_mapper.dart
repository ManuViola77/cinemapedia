import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details_moviedb.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movie) => Movie(
    adult: movie.adult,
    backdropPath:
        movie.backdropPath != ''
            ? '${Environment.imageUrl}${movie.backdropPath}'
            : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdSx3JMdW7BwCPy6VFIrEMZI3Q7p-pIdVedA&s',
    genreIds: movie.genreIds.map((e) => e.toString()).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath:
        movie.posterPath != ''
            ? '${Environment.imageUrl}${movie.posterPath}'
            : 'no-poster',
    releaseDate:
        movie.releaseDate != null ? movie.releaseDate! : DateTime.now(),
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );

  static Movie movieDetailsMovieDBToEntity(
    MovieDetailsMovieDb movieDb,
  ) => Movie(
    adult: movieDb.adult,
    backdropPath:
        movieDb.backdropPath != ''
            ? '${Environment.imageUrl}${movieDb.backdropPath}'
            : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdSx3JMdW7BwCPy6VFIrEMZI3Q7p-pIdVedA&s',
    genreIds: movieDb.genres.map((e) => e.name.toString()).toList(),
    id: movieDb.id,
    originalLanguage: movieDb.originalLanguage,
    originalTitle: movieDb.originalTitle,
    overview: movieDb.overview,
    popularity: movieDb.popularity,
    posterPath:
        movieDb.posterPath != ''
            ? '${Environment.imageUrl}${movieDb.posterPath}'
            : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdSx3JMdW7BwCPy6VFIrEMZI3Q7p-pIdVedA&s',
    releaseDate: movieDb.releaseDate,
    title: movieDb.title,
    video: movieDb.video,
    voteAverage: movieDb.voteAverage,
    voteCount: movieDb.voteCount,
  );
}
