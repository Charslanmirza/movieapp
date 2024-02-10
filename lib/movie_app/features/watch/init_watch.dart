import 'package:get/get.dart';
import 'package:movieapp/movie_app/features/watch/data/data_source/watch_data_source.dart';
import 'package:movieapp/movie_app/features/watch/data/repositories/watch_repo_impl.dart';
import 'package:movieapp/movie_app/features/watch/entities/repo/watch_repo.dart';
import 'package:movieapp/movie_app/features/watch/presentation/get/watch_controller.dart';

initWatch() {
  Get.lazyPut<WatchRepo>(
      () =>
          WatchRepoImpl(remoteDataSource: Get.find(), networkInfo: Get.find()),
      fenix: true);
  Get.lazyPut<WatchRemoteDataSource>(
      () => WatchRemoteDataSourceImpl(Get.find()),
      fenix: true);

  Get.lazyPut(() => WatchController(watchRepo: Get.find()), fenix: true);
}
