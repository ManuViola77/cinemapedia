import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class MoviedbDatasourceImpl implements MoviesDataSource {
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
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    // TODO: map data
    final List<Movie> movies = response.data['results'];

    return movies;
  }
}
