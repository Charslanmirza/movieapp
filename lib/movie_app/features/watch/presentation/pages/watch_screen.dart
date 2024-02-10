import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/movie_app/features/watch/builder_id.dart';
import 'package:movieapp/movie_app/features/watch/presentation/get/watch_controller.dart';
import 'package:movieapp/movie_app/features/watch/presentation/pages/movie_search_screen.dart';
import 'package:movieapp/movie_app/features/watch/widgets/movie_card_widget.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(.3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Watch",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => MovieSearchScreen());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: GetBuilder<WatchController>(
          id: watchScreenBuilder,
          builder: (watchController) {
            if (watchController.isListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
                itemCount: watchController.upcomingMoviesList.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return PopularMoviesCarouselItem(
                    movie: watchController.upcomingMoviesList[index],
                    movieId:
                        watchController.upcomingMoviesList[index].id.toString(),
                    imgPath:
                        watchController.upcomingMoviesList[index].posterPath,
                  );
                },
              );
            }
          }),
    );
  }
}
