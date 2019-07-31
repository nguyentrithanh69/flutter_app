import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_app/movie/movie.dart';
import 'package:flutter_app/app_constant.dart';

class MovieApiProvider{
  Dio dio = new Dio();

  Future<MovieResponse> fetchMovieListPopular() async {
    final response = await dio.get(popularApi);
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(response.data);
    } else {
      throw Exception("failed to get data");
    }
  }

  Future<MovieResponse> fetchMovieListTopRated() async {
    final response = await dio.get(topRatedApi);
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(response.data);
    } else {
      throw Exception("failed to get data");
    }
  }

  Future<MovieResponse> fetchMovieListUpcoming() async {
    final response = await dio.get(upcomingApi);
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(response.data);
    } else {
      throw Exception("failed to get data");
    }
  }

  Future<MovieResponse> fetchMovieListNowPlaying() async {
    final response = await dio.get(nowPlayingApi);
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(response.data);
    } else {
      throw Exception("failed to get data");
    }
  }

  Future<MovieImageResponse> fetchMovieImageList(int movieId) async {
    final response = await dio.get(movieImageApi(movieId));
    if (response.statusCode == 200) {
      return MovieImageResponse.fromJson(response.data);
    } else {
      throw Exception("failed to get data");
    }
  }
}