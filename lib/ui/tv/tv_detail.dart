import 'package:flutter/material.dart';
import 'package:flutter_app/ui/image_network.dart';
import 'package:flutter_app/model/tv.dart';
import 'package:flutter_app/bloc/tv_bloc.dart';
import 'package:flutter_app/resources/utils.dart';
import 'package:flutter_app/ui/tv/tv_image_screen.dart';
import 'package:flutter_app/resources/app_constant.dart';


// ignore: must_be_immutable
class TvDetail extends StatefulWidget {
  Tv _tv;

  TvDetail(this._tv);

  @override
  _TvDetailState createState() => _TvDetailState(_tv);
}

class _TvDetailState extends State<TvDetail> {
  Tv _tv;

  _TvDetailState(this._tv);

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = new AppBar(
      title: Text(_tv.name),
      backgroundColor: Colors.black,
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
        'https://image.tmdb.org/t/p/w780${_tv.backdrop_path}',
        imageMovieBackDropPlaceHolder);
    final ImageNetWork posterImage = new ImageNetWork(
        'https://image.tmdb.org/t/p/w500${_tv.poster_path}',
        imageMoviePosterPlaceHolder);

    final Container containerImage = new Container(
      width: widthPosterMovie,
      height: heightPosterMovie,
      margin: EdgeInsets.only(left: 10, top: 140),
      child: Hero(tag: '${_tv.poster_path}', child: posterImage),
    );

    final containerInfor = new Container(
      margin: EdgeInsets.only(left: 10, top: heightPosterMovie),
      child: Column(
        children: <Widget>[
          Text(_tv.name,
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
        _tv.overview,
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
    tvBloc.fetchAllTvImage(_tv.id);
    return new Container(
      child: StreamBuilder(
          stream: tvBloc.tvImageList,
          builder: (BuildContext mContext,
              AsyncSnapshot<TvImageResponse> snapshot) {
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
