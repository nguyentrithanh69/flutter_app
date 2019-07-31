import 'package:flutter_app/respository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_app/movie/movie.dart';

class MovieBloc {
  final _respository = new Respository();
  final _movieFetcher = PublishSubject<MovieResponse>();
  final _movieImageFetcher = PublishSubject<MovieImageResponse>();

  Observable<MovieResponse> get movieList => _movieFetcher.stream;
  Observable<MovieImageResponse> get movieImageList => _movieImageFetcher.stream;

  fetchAllMoviePopular() async {
    MovieResponse movieResponse = await _respository.fetchMovieListPopular();
    _movieFetcher.sink.add(movieResponse);
  }

  fetchAllMovieTopRated() async {
    MovieResponse movieResponse = await _respository.fetchMovieListTopRated();
    _movieFetcher.sink.add(movieResponse);
  }

  fetchAllMovieUpcoming() async {
    MovieResponse movieResponse = await _respository.fetchMovieListUpcoming();
    _movieFetcher.sink.add(movieResponse);
  }

  fetchAllMovieNowPlaying() async {
    MovieResponse movieResponse = await _respository.fetchMovieListNowPlaying();
    _movieFetcher.sink.add(movieResponse);
  }

  fetchAllMovieImage(int movieId) async {
    MovieImageResponse movieImageResponse = await _respository.fetchMovieImageList(movieId);
    _movieImageFetcher.sink.add(movieImageResponse);
  }

  dispose(){
    _movieFetcher.close();
    _movieImageFetcher.close();
  }
}

MovieBloc movieBloc = new MovieBloc();