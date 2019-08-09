import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_app/model/actor.dart';
import 'package:flutter_app/resources/app_constant.dart';

class ActorApiProvider {
  Dio dio = new Dio();

  //Fetch Actor Popular
  Future<ActorResponse> fetchActorPopular() async{
    final response =await dio.get(actorPopularApi);
    if(response.statusCode == 200){
      return ActorResponse.fromJson(response.data);
    }else {
      throw Exception("Failed to get data");
    }
  }
}