import 'package:cinemapedia_220192/presentation/providers/movies/movie_slideshow_provider.dart';
import 'package:cinemapedia_220192/presentation/widgets/movies/movie_horizontal_listview.dart';
import 'package:cinemapedia_220192/presentation/widgets/shared/custom_button_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220192/presentation/widgets/widgets.dart';
import 'package:cinemapedia_220192/presentation/providers/movies/movies_providers.dart';

class HomeScreen extends StatelessWidget {
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

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);

    return Column(
      children: [
        CustomAppbar(),
        MovieSlideshow(movies: slideShowMovies),
        MovieHorizontalListview(
          movies: nowPlayingMovies,
          title: 'En cines',
          subTitle: 'Miercoles, 22 de Octubre',
          loadNextPage: () {
            print('Evento lanzado por el listener de HorizontalListView');
          },
        ),
      ],
    );
  }
}
