import 'package:get/get.dart';
import 'package:movieapp/core/enums.dart';
import 'package:movieapp/core/error/errors.dart';
import 'package:movieapp/movie_app/features/watch/builder_id.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/movies_details.dart';
import 'package:movieapp/movie_app/features/watch/entities/repo/watch_repo.dart';

class CategoryController extends GetxController {
  CustomError? customError;

  final WatchRepo watchRepo;

  String? movieId;

  CategoryController({required this.watchRepo, this.movieId});

  MovieDetailsModel? movieDetailsModel;

  LoadingState movieDetailLoadingState = LoadingState.loading;

  bool get isMovieDetailLoading =>
      movieDetailLoadingState == LoadingState.loading;

  bool get hasListLoadingFailed => customError != null;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

}
