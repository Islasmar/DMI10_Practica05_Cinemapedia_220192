import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_220192/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia_220192/domain/entities/movie.dart';

class MovieHorizontalListview extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  State<MovieHorizontalListview> createState() =>
      _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {
  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    @override
    initState() {
      super.initState();
      scrollController.addListener(() {
        if (widget.loadNextPage == null) return;
        if(scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent){
            print('Caragar las películas siguientes');
            widget.loadNextPage!();
          }
      });
    }

    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _CurrDate(place: widget.title, formatedDate: widget.subTitle),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: widget.movies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ),

          SizedBox(
            width: 150,
            child: Text(movie.title, maxLines: 2, style: textStyles.titleSmall),
          ),

          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                const SizedBox(width: 3),
                Text(
                  '${movie.voteAverage}',
                  style: textStyles.bodyMedium?.copyWith(
                    color: Colors.yellow.shade800,
                  ),
                ),
                Spacer(),
                const SizedBox(width: 10),
                Text(
                  HumanFormats.humanReadbleNumber(movie.popularity),
                  style: textStyles.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrDate extends StatelessWidget {
  final String? place;
  final String? formatedDate;

  const _CurrDate({this.place, this.formatedDate});

  @override
  Widget build(BuildContext context) {
    final placeStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (place != null) Text(place!, style: placeStyle),
          Spacer(),
          if (formatedDate != null)
            FilledButton.tonal(onPressed: () {}, child: Text(formatedDate!)),
        ],
      ),
    );
  }
}
