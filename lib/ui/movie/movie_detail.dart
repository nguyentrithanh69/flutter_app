import 'package:flutter/material.dart';
import 'package:flutter_app/ui/image_network.dart';
import 'package:flutter_app/model/movie.dart';
import 'package:flutter_app/bloc/movie_bloc.dart';
import 'package:flutter_app/resources/utils.dart';
import 'package:flutter_app/ui/movie/movie_image_screen.dart';
import 'package:flutter_app/resources/app_constant.dart';


// ignore: must_be_immutable
class MovieDetail extends StatefulWidget {
  Movie _movie;

  MovieDetail(this._movie);

  @override
  _MovieDetailState createState() => _MovieDetailState(_movie);
}

class _MovieDetailState extends State<MovieDetail> {
  Movie _movie;

  _MovieDetailState(this._movie);

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = new AppBar(
      title: Text(_movie.title),
      backgroundColor: Colors.blueGrey,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.favorite_border),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.home),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.filter_list),
        )
      ],
    );
    final widgetTop = buildTopView(context);


    final parent = new Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[widgetTop],
    );

    final Scaffold scaffold = new Scaffold(
        appBar: appBar,
        body: parent);

    return scaffold;
  }

  //Build Top View
  Widget buildTopView(BuildContext context) {
    double widthPosterMovie = getScreenWidth(context) / 3.0;
    double heightPosterMovie = 3 * widthPosterMovie / 2.0;
    //Backdrop
    final ImageNetWork backDropImage = new ImageNetWork(
        'https://image.tmdb.org/t/p/w780${_movie.backdrop_path}',
        imageMovieBackDropPlaceHolder);
    final ImageNetWork posterImage = new ImageNetWork(
        'https://image.tmdb.org/t/p/w500${_movie.poster_path}',
        imageMoviePosterPlaceHolder);

    final Container containerImage = new Container(
      width: widthPosterMovie,
      height: heightPosterMovie,
      margin: EdgeInsets.only(left: 10, top: 140),
      child: Hero(tag: '${_movie.poster_path}', child: posterImage),
    );

    final containerInfor = new Container(
      margin: EdgeInsets.only(left: 10, top: heightPosterMovie),
      child: Column(
        children: <Widget>[
          Text(_movie.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ],
      ),
    );

    final Stack stack = new Stack(
      children: <Widget>[
        backDropImage,
        Row(
          children: <Widget>[
            Flexible(
              child: containerImage,
              flex: 1,
            ),
            Flexible(
              child: containerInfor,
              flex: 1,
            )
          ],
        )
      ],
    );

    final overViewText = new Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      child: Text(
        _movie.overview,
        style: TextStyle(fontSize: 20.0),
      ),
    );

    final imageListView = buildImageMovieList(context);

    return new Expanded(
        child: new ListView(
          padding: EdgeInsets.all(0.0),
          shrinkWrap: true,
          children: <Widget>[
            //Your content
            stack, overViewText, imageListView
          ],
        ));
  }

  //Build movie image list
  Widget buildImageMovieList(BuildContext context) {
    movieBloc.fetchAllMovieImage(_movie.id);
    return new Container(
      child: StreamBuilder(
          stream: movieBloc.movieImageList,
          builder: (BuildContext mContext,
              AsyncSnapshot<MovieImageResponse> snapshot) {
            if (snapshot.hasData) {
              return new MovieImageWidget(posterImages: snapshot.data.posters, backDropImages: snapshot.data.backdrops);
            } else {
              return Center(
                child: new CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
