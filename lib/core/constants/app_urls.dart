import 'package:get/get.dart';

class AppUrls {
  static final baseUrl = 'https://api.themoviedb.org/3/';


  static final testUrl = "${baseUrl}movie/";

  static final trialerUrl = "https://api.themoviedb.org/3/movie/";
  static final apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMGNkYTg5Mjg1YTcwYTdmMzQ1ZTRmNGQ0OWVlODg0ZSIsInN1YiI6IjY1Yzc1MmJmZTI5NWI0MDE0OGY3ZTlmNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lFLYe1mbF_r6pHi_wpurjSVXAAVHmQJ1XRnZhcW8zFY";


  static imageUrl(String model, int id) =>
      "${baseUrl}web/image?model=$model&id=$id&field=image_1920";
}
