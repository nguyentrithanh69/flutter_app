import 'package:flutter_app/resources/respository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_app/model/tv.dart';

class TvBloc {
  final _respository = new Respository();
  final _tvFetcher = PublishSubject<TvResponse>();
  final _tvImageFetcher = PublishSubject<TvImageResponse>();

  Observable<TvResponse> get tvShowList => _tvFetcher.stream;
  Observable<TvImageResponse> get tvImageList => _tvImageFetcher.stream;

  fetchAllTvPopular() async {
    TvResponse tvResponse = await _respository.fetchTvListPopular();
    _tvFetcher.sink.add(tvResponse);
  }

  fetchAllTvTopRated() async {
    TvResponse tvResponse = await _respository.fetchTvListTopRated();
    _tvFetcher.sink.add(tvResponse);
  }

  fetchAllTvOnTv() async {
    TvResponse tvResponse = await _respository.fetchTvListOnTv();
    _tvFetcher.sink.add(tvResponse);
  }

  fetchAllTvAiringToday() async {
    TvResponse tvResponse = await _respository.fetchTvListAiringToday();
    _tvFetcher.sink.add(tvResponse);
  }
  fetchAllTvImage(int tvId) async {
    TvImageResponse tvImageResponse = await _respository.fetchTvImageList(tvId);
    _tvImageFetcher.sink.add(tvImageResponse);
  }

  dispose(){
    _tvFetcher.close();
    _tvImageFetcher.close();
  }

}

TvBloc tvBloc = new TvBloc();