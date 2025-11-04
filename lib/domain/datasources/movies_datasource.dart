import 'package:cinemapedia_220192/domain/entities/movie.dart';

abstract class MoviesDatasource {

    Future<List<Movie>> getNowPlaying({int page = 1});
    Future<List<Movie>> getPopular({int page = 1});
    Future<List<Movie>> getUpComing({int page = 1});
    Future<List<Movie>>  getTopRated({int page = 1});
    Future<List<Movie>> getMexicanMovies({int page = 1});

}