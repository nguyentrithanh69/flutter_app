import 'package:flutter_app/movie/movie.dart';
import 'package:flutter_app/movie/movie_api_provider.dart';

class Respository {
  MovieApiProvider movieApiProvider = new MovieApiProvider();

  Future<MovieResponse> fetchMovieListPopular() => movieApiProvider.fetchMovieListPopular();
  Future<MovieResponse> fetchMovieListTopRated() => movieApiProvider.fetchMovieListTopRated();
  Future<MovieResponse> fetchMovieListUpcoming() => movieApiProvider.fetchMovieListUpcoming();
  Future<MovieResponse> fetchMovieListNowPlaying() => movieApiProvider.fetchMovieListNowPlaying();

  Future<MovieImageResponse> fetchMovieImageList(int movieId) => movieApiProvider.fetchMovieImageList(movieId);
}