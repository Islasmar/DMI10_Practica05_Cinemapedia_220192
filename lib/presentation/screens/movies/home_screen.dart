import 'package:cinemapedia_220192/presentation/providers/movies/movie_slideshow_provider.dart';
import 'package:cinemapedia_220192/presentation/widgets/movies/movie_horizontal_listview.dart';
import 'package:cinemapedia_220192/presentation/widgets/shared/custom_button_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220192/presentation/widgets/widgets.dart';
import 'package:cinemapedia_220192/presentation/providers/movies/movies_providers.dart';


class HomeScreen extends StatelessWidget {
  // Nombre estático de la ruta para la navegación
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomButtonNavigationbar(),
    );
  }
}

/// Vista interna de la HomeScreen que puede reaccionar a cambios de estado (ConsumerStatefulWidget)
class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref
        .read(nowPlayingMoviesProvider.notifier)
        .loadNextPage(); // Carga la primera página de películas al iniciar la pantalla
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppbar(),

          // Solo muestra las primeras 6 películas en el slideshow
          MovieSlideshow(movies: nowPlayingMovies.take(6).toList()),

          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'En cines',
            subTitle: 'Miércoles, 22 de Octubre',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Próximamente',
            subTitle: 'Noviembre',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Populares',
            subTitle: 'Miércoles, 22 de Octubre',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Mejor Calificadas',
            subTitle: 'Miércoles, 22 de Octubre',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Picardia Mexicana',
            subTitle: 'Miércoles, 22 de Octubre',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),

          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}