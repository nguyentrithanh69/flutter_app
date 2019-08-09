import 'package:flutter_app/model/movie.dart';
import 'package:flutter_app/resources/movie/movie_api_provider.dart';
import 'package:flutter_app/resources/tv/tv_api_provider.dart';
import 'package:flutter_app/model/tv.dart';

class Respository {
  MovieApiProvider movieApiProvider = new MovieApiProvider();

  Future<MovieResponse> fetchMovieListPopular() => movieApiProvider.fetchMovieListPopular();
  Future<MovieResponse> fetchMovieListTopRated() => movieApiProvider.fetchMovieListTopRated();
  Future<MovieResponse> fetchMovieListUpcoming() => movieApiProvider.fetchMovieListUpcoming();
  Future<MovieResponse> fetchMovieListNowPlaying() => movieApiProvider.fetchMovieListNowPlaying();

  Future<MovieImageResponse> fetchMovieImageList(int movieId) => movieApiProvider.fetchMovieImageList(movieId);

  TvApiProvider tvApiProvider = new TvApiProvider();

  Future<TvResponse> fetchTvListPopular() => tvApiProvider.fetchTvListPopular();
  Future<TvResponse> fetchTvListTopRated() => tvApiProvider.fetchTvListTopRated();
  Future<TvResponse> fetchTvListOnTv() => tvApiProvider.fetchTvListOnTv();
  Future<TvResponse> fetchTvListAiringToday() => tvApiProvider.fetchTvListAiringToday();

  Future<TvImageResponse> fetchTvImageList(int tvId) => tvApiProvider.fetchMovieImageList(tvId);



}