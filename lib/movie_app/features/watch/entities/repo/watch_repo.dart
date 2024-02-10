import 'package:movieapp/movie_app/features/watch/entities/model/movies_details.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/upcomming_movies.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/video_model.dart';

abstract class WatchRepo {
  Future<List<UpcomingMoviesModel>> getUpComingMoviesList();

  Future<MovieDetailsModel> getMoviesDetails(String movieId);

  Future<VideoModel?> loadTrailer(String movieId);
}
