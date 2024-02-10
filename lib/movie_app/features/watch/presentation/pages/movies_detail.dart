import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/constants/place_holders.dart';
import 'package:movieapp/core/utils/utils.dart';
import 'package:movieapp/core/widgets/button_widget.dart';
import 'package:movieapp/movie_app/features/watch/builder_id.dart';
import 'package:movieapp/movie_app/features/watch/presentation/get/movie_detail_controller.dart';
import 'package:movieapp/movie_app/features/watch/presentation/pages/seat_mapping.dart';
import 'package:movieapp/movie_app/features/watch/presentation/pages/youtube_player.dart';
import 'package:movieapp/movie_app/features/watch/widgets/gener_container_widget.dart';

class MovieDetailPage extends StatefulWidget {
  MovieDetailPage({super.key, required this.movieId, required this.imgPath});

  final String movieId;
  final String imgPath;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MoviesDetailController>(
        id: moviesDetailBuilder,
        init: MoviesDetailController(
          watchRepo: Get.find(),
          movieId: widget.movieId,
        ),
        builder: (moviesDetailController) {
          if (moviesDetailController.isMovieDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Image.network(
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                        'https://image.tmdb.org/t/p/w500/${widget.imgPath}',
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent.withOpacity(.4),
                                  Theme.of(context)
                                      .colorScheme
                                      .background
                                      .withOpacity(.4),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  child: Text(
                                    "In theaters ${formatReleaseDate(moviesDetailController.movieDetailsModel?.releaseDate) ?? ''}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                minPlaceHolder,
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ButtonWidget(
                                      text: "Get Tickets",
                                      // width: MediaQuery.of(context).size.width,
                                      buttonType: ButtonType.fill,
                                      onPressed: () {
                                        Get.to(() => SeatMappingScreen(
                                              name: moviesDetailController
                                                  .movieDetailsModel!.title,
                                              date: moviesDetailController
                                                  .movieDetailsModel!
                                                  .releaseDate,
                                            ));
                                      },
                                    ),
                                    minPlaceHolder,
                                    ButtonWidget(
                                      text: "Watch Trailer",
                                      icon: Icon(
                                        Icons.play_arrow_outlined,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                      ),
                                      buttonType: ButtonType.transparent,
                                      isLoading: moviesDetailController
                                          .isTrailerLoading,
                                      onPressed: () {
                                        moviesDetailController.loadTrailer(context);
                                         },
                                    ),
                                  ],
                                ),
                                sizeFieldLargePlaceHolder,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Genres",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        sizeFieldMediumPlaceHolder,
                        Wrap(
                          spacing: 9,
                          runSpacing: 12,
                          children: moviesDetailController
                                  .movieDetailsModel?.genres
                                  .map((genre) => buildGenreContainer(genre))
                                  .toList() ??
                              [],
                        ),
                        sizeFieldLargePlaceHolder,
                        Text(
                          "Overview",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        minPlaceHolder,
                        Text(
                          moviesDetailController.movieDetailsModel?.overview ??
                              '',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Color(0xFF8F8F8F)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
