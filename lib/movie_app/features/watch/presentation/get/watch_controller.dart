import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/enums.dart';
import 'package:movieapp/core/error/errors.dart';
import 'package:movieapp/movie_app/features/watch/builder_id.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/movies_details.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/upcomming_movies.dart';
import 'package:movieapp/movie_app/features/watch/entities/repo/watch_repo.dart';

class WatchController extends GetxController {
  CustomError? customError;

  final WatchRepo watchRepo;

  String? movieId;

  WatchController({required this.watchRepo, this.movieId});

  List<UpcomingMoviesModel> upcomingMoviesList = [];

  LoadingState listLoadingState = LoadingState.loading;

  bool get isListLoading => listLoadingState == LoadingState.loading;

  bool get hasListLoadingFailed => customError != null;

  bool get isListEmpty => upcomingMoviesList.isEmpty;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getUpComingMoviesList();

    print('objecswasdasdasdasdt${upcomingMoviesList.length}');
  }

  Future getUpComingMoviesList() async {
    listLoadingState = LoadingState.loading;
    update([watchScreenBuilder]);

    try {
      watchRepo.getUpComingMoviesList().then((value) {
        upcomingMoviesList = value;
        listLoadingState = LoadingState.loaded;
        update([watchScreenBuilder]);
      });

      customError = null;
    } on CustomError catch (error) {
      customError = error;
      listLoadingState = LoadingState.loaded;
      update([watchScreenBuilder]);
    }
  }
}
