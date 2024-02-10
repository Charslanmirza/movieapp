import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/enums.dart';
import 'package:movieapp/core/error/errors.dart';
import 'package:movieapp/movie_app/features/watch/builder_id.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/movies_details.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/upcomming_movies.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/video_model.dart';
import 'package:movieapp/movie_app/features/watch/entities/repo/watch_repo.dart';
import 'package:movieapp/movie_app/features/watch/presentation/pages/youtube_player.dart';

class MoviesDetailController extends GetxController {
  CustomError? customError;

  final WatchRepo watchRepo;

  String? movieId;

  MoviesDetailController({required this.watchRepo, this.movieId});

  MovieDetailsModel? movieDetailsModel;
  VideoModel? videoModel;

  LoadingState movieDetailLoadingState = LoadingState.loading;

  bool get isMovieDetailLoading =>
      movieDetailLoadingState == LoadingState.loading;

  LoadingState trailerLoadingState = LoadingState.loaded;

  bool get isTrailerLoading => trailerLoadingState == LoadingState.loading;

  bool get hasListLoadingFailed => customError != null;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getMovieDetails();
  }

  Future getMovieDetails() async {
    movieDetailLoadingState = LoadingState.loading;
    update([moviesDetailBuilder]);

    try {
      watchRepo.getMoviesDetails(movieId!).then((value) {
        movieDetailsModel = value;
        movieDetailLoadingState = LoadingState.loaded;
        update([moviesDetailBuilder]);
      });

      customError = null;
    } on CustomError catch (error) {
      customError = error;
      movieDetailLoadingState = LoadingState.loaded;
      update([moviesDetailBuilder]);
    }
  }

  Future loadTrailer(BuildContext context) async {
    trailerLoadingState = LoadingState.loading;
    update([moviesDetailBuilder]);

    try {
      await watchRepo.loadTrailer(movieId!).then((value) {
        videoModel = value;

        Get.to(() =>
            YoutubeVideo('https://www.youtube.com/watch?v=${value!.key}'));

        trailerLoadingState = LoadingState.loaded;
        update([moviesDetailBuilder]);
      });

      customError = null;
    } on CustomError catch (error) {
      customError = error;
      trailerLoadingState = LoadingState.loaded;
      update([moviesDetailBuilder]);
    }
  }
}
