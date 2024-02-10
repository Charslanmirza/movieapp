import 'package:get/get.dart';
import 'package:movieapp/movie_app/features/watch/init_watch.dart';
import 'package:movieapp/movie_app/features/watch/presentation/get/watch_controller.dart';

initAll() {
  initWatch();
}

removeAll() {
  Get.delete<WatchController>();
}
