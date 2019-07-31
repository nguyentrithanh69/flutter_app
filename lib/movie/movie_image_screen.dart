import 'package:flutter/material.dart';
import 'package:flutter_app/movie/movie.dart';
import 'package:flutter_app/image_network.dart';
import 'package:flutter_app/app_constant.dart';

// ignore: must_be_immutable
class MovieImageWidget extends StatelessWidget {
  final List<MovieImage> posterImages;
  final List<MovieImage> backDropImages;

  List<MovieImage> images = new List();


  MovieImageWidget({Key key, this.posterImages, this.backDropImages}) : super(key: key);

  Widget _buildItemImage(BuildContext context, int index){
    MovieImage imageItem = images[index];
    String imagePlaceHolder = imageMoviePosterPlaceHolder;
    String imageUrl = "";
    if(imageItem != null){
      if(imageItem.isPoster == true){
        imageUrl = 'https://image.tmdb.org/t/p/w185${imageItem.file_path}';
        imagePlaceHolder = imageMoviePosterPlaceHolder;
      }else {
        imageUrl = 'https://image.tmdb.org/t/p/w300${imageItem.file_path}';
        imagePlaceHolder = imageMovieBackDropPlaceHolder;
      }
    }

    return new Container(
        padding: EdgeInsets.all(2.0),
        child: new Container(
          child:  new ImageNetWork(imageUrl,
              imagePlaceHolder),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    images.addAll(posterImages);
    images.addAll(backDropImages);
    int totalImage = this.images.length;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 150.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: totalImage,
          itemBuilder:_buildItemImage
      ),
    );
  }
}
