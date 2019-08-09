import 'dart:async';
import 'package:flutter_app/resources/app_constant.dart';
import 'package:flutter_app/model/tv.dart';
import 'package:dio/dio.dart';

class TvApiProvider {
  Dio dio = new Dio();

  Future<TvResponse> fetchTvListPopular() async {
    final response = await dio.get(tvPopularApi);
    if (response.statusCode == 200) {
      return TvResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<TvResponse> fetchTvListTopRated() async {
    final response = await dio.get(tvTopRatedApi);
    if (response.statusCode == 200) {
      return TvResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<TvResponse> fetchTvListOnTv() async {
    final response = await dio.get(tvOnTvApi);
    if (response.statusCode == 200) {
      return TvResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<TvResponse> fetchTvListAiringToday() async {
    final response = await dio.get(tvAiringTodayApi);
    if (response.statusCode == 200) {
      return TvResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<TvImageResponse> fetchMovieImageList(int tvId) async {
    final response = await dio.get(movieImageApi(tvId));
    if (response.statusCode == 200) {
      return TvImageResponse.fromJson(response.data);
    } else {
      throw Exception("failed to get data");
    }
  }


}