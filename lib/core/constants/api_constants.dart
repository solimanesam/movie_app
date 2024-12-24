const String apiKey = '180beb7d896a24a07b0f89d0a28b67de';
const String baseUrl = 'https://api.themoviedb.org/3';
const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
const String urlpopular = '$baseUrl/movie/popular?api_key=$apiKey';
const String urlnowplaying = '$baseUrl/movie/now_playing?api_key=$apiKey';
const String urltoprated = '$baseUrl/movie/top_rated?api_key=$apiKey';
String imageUrl(String path) => '$baseImageUrl$path';
String movieDetailsPath(int movieId) =>
    "$baseUrl/movie/$movieId?api_key=$apiKey";
