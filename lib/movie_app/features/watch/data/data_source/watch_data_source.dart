import 'package:dio/dio.dart';
import 'package:movieapp/core/constants/app_urls.dart';
import 'package:movieapp/core/error/errors.dart';
import 'package:movieapp/core/utils/utils.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/movies_details.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/upcomming_movies.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/video_model.dart';
import 'package:movieapp/movie_app/features/watch/url.dart';

abstract class WatchRemoteDataSource {
  Future<List<UpcomingMoviesModel>> getUpComingMoviesList();

  Future<MovieDetailsModel> getMoviesDetails(String movieId);

  Future<VideoModel?> loadTrailer(String movieId);
}

class WatchRemoteDataSourceImpl implements WatchRemoteDataSource {
  final Dio _dio;

  WatchRemoteDataSourceImpl(this._dio);

  @override
  Future<List<UpcomingMoviesModel>> getUpComingMoviesList() async {
    final response = await _dio.get(
      AppUrls.testUrl + upcomingMoviesUrl,
      options: Options(
        contentType: "application/json",
        validateStatus: (status) {
          return true;
        },
        headers: {
          "Authorization": "Bearer ${AppUrls.apiKey}",
        },
      ),
    );

    customLog(
        url: "upcoming url is ${AppUrls.testUrl + upcomingMoviesUrl}",
        body: {"params"},
        response: response.data);

    Map<String, dynamic> decodedJson = response.data;

    if (response.statusCode != 200) {
      return Future.error(
        GeneralError(
            title: 'Products List',
            message: 'An error occurred while fetching products list.'),
      );
    }
    return decodedJson['results']
        .map<UpcomingMoviesModel>((internalTransferResponse) =>
            UpcomingMoviesModel.fromJson(internalTransferResponse))
        .toList();
  }

  @override
  Future<VideoModel?> loadTrailer(String movieId) async {
    final response = await _dio.get(
      AppUrls.trialerUrl + '${movieId}' + '/videos',
      options: Options(
        contentType: "application/json",
        validateStatus: (status) {
          return true;
        },
        headers: {
          "Authorization": "Bearer ${AppUrls.apiKey}",
        },
      ),
    );

    customLog(
        url: "url is ${AppUrls.trialerUrl + '${movieId}' + '/videos'}",
        body: {"params"},
        response: response.data);

    if (response.statusCode != 200) {
      return Future.error(
        GeneralError(
          title: 'Products List',
          message: 'An error occurred while fetching products list.',
        ),
      );
    }

    for (var result in response.data['results']) {
      if (result['type'] == 'Trailer') {
        return VideoModel.fromJson(result);
      }
    }

    return null; // Return null if no "Trailer" type is found.
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(String movieId) async {
    final response = await _dio.get(AppUrls.testUrl + movieId,
        options: Options(
          contentType: "application/json",
          validateStatus: (status) {
            return true;
          },
          headers: {
            "Authorization": "Bearer ${AppUrls.apiKey}",
          },
        ));

    Map<String, dynamic> decodedJson = response.data;

    customLog(
        url: 'get movies detail url is ${AppUrls.testUrl + movieId}',
        response: decodedJson);
    if (response.statusCode != 200) {
      return Future.error(
        GeneralError(
            title: 'Get Vehicle Details',
            message: 'An error occurred while fetching the data.'),
      );
    }
    return MovieDetailsModel.fromJson(decodedJson);
  }
}
