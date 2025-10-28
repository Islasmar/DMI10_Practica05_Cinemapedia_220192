import 'movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220192/domain/entities/movie.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  // Obtiene las películas populares desde el provider de películas
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowPlayingMovies.isEmpty) return [];
  // Retorna las primeras 5 películas para el slideshow
  return nowPlayingMovies.sublist(0, 6);
});
