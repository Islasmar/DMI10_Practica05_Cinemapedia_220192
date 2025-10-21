import 'package:cinemapedia_220192/infraestructure/models/moviedb/movie_moviedb.dart';
import 'package:cinemapedia_220192/domain/entities/movie.dart';

class MovieMapper {

  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '') 
      ? 'http://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
      : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
      genreIds: moviedb.genreIds,
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '') 
      ? 'http://image.tmdb.org/t/p/w500${moviedb.posterPath}'
      : 'no-poster',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
  );      
}