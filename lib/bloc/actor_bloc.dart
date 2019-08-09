import 'package:flutter_app/resources/respository.dart';
import 'package:flutter_app/model/actor.dart';
import 'package:rxdart/rxdart.dart';


class ActorBloc {
  final _respository = new Respository();
  final _actorFetcher = PublishSubject<ActorResponse>();

  Observable<ActorResponse> get actorList => _actorFetcher.stream;


  fetchActorPopular() async {
    ActorResponse actorResponse = await _respository.fetchActorPopular();
    _actorFetcher.sink.add(actorResponse);
  }


  dispose(){
    _actorFetcher.close();
  }

}

ActorBloc actorBloc = new ActorBloc();