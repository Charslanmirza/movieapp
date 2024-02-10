import 'dart:io';
import 'package:movieapp/core/error/errors.dart';
import 'package:movieapp/core/services/network_service.dart';
import 'package:movieapp/core/utils/utils.dart';
import 'package:movieapp/movie_app/features/watch/data/data_source/watch_data_source.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/movies_details.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/upcomming_movies.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/video_model.dart';
import 'package:movieapp/movie_app/features/watch/entities/repo/watch_repo.dart';

class WatchRepoImpl implements WatchRepo {
  final WatchRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  WatchRepoImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<List<UpcomingMoviesModel>> getUpComingMoviesList() async {
    // TODO: implement getImagesList
    await checkNetwork(networkInfo);

    try {
      return await remoteDataSource.getUpComingMoviesList();
    } on GeneralError catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(String movieId) async {
    // TODO: implement getImagesList
    await checkNetwork(networkInfo);

    try {
      return await remoteDataSource.getMoviesDetails(movieId);
    } on GeneralError catch (error) {
      return Future.error(error);
    }
  }


  @override
  Future<VideoModel?> loadTrailer(String movieId) async {
    // TODO: implement getImagesList
    await checkNetwork(networkInfo);

    try {
      return await remoteDataSource.loadTrailer(movieId);
    } on GeneralError catch (error) {
      return Future.error(error);
    }
  }
}
