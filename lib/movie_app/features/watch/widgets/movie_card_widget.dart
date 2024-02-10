import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/movie_app/features/watch/entities/model/upcomming_movies.dart';
import 'package:movieapp/movie_app/features/watch/presentation/pages/movies_detail.dart';

class PopularMoviesCarouselItem extends StatelessWidget {
  const PopularMoviesCarouselItem(
      {super.key,
      required this.movie,
      required this.movieId,
      required this.imgPath});

  final UpcomingMoviesModel movie;
  final String movieId;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MovieDetailPage(
              movieId: movieId,
              imgPath: imgPath,
            ));
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16), // Same radius as the Card
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  'https://image.tmdb.org/t/p/w500/${imgPath}',
                  // Set the height to 30% of the screen height
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Text(
                  movie.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
              )
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
