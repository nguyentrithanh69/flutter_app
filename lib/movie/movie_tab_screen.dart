import 'package:flutter/material.dart';
import 'package:flutter_app/app_constant.dart';
import 'package:flutter_app/enum.dart';
import 'package:flutter_app/help.dart';
import 'package:flutter_app/image_network.dart';
import 'package:flutter_app/movie/movie.dart';
import 'package:flutter_app/movie/movie_bloc.dart';
import 'package:flutter_app/movie/movie_detail.dart';
import 'package:flutter_app/utils.dart';


// ignore: must_be_immutable
class MovieTabScreen extends StatelessWidget {
  MovieApiType movieApiType;

  MovieTabScreen({Key key, this.movieApiType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch (movieApiType) {
      case MovieApiType.POPULAR:
        movieBloc.fetchAllMoviePopular();
        break;
      case MovieApiType.TOP_RATED:
        movieBloc.fetchAllMovieTopRated();
        break;
      case MovieApiType.UPCOMING:
        movieBloc.fetchAllMovieUpcoming();
        break;
      case MovieApiType.NOW_PLAYING:
        movieBloc.fetchAllMovieNowPlaying();
        break;
    }

    return Container(
      child: StreamBuilder(
          stream: movieBloc.movieList,
          builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
            if (snapshot.hasData) {
              return buildList(context, snapshot);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

Widget buildList(BuildContext context, AsyncSnapshot<MovieResponse> snapshot) {
  double sizeImageWidth = getScreenWidth(context) / 3.0;
  double sizeImageHeight = 3.0 * sizeImageWidth / 2.0 + 50;

  openDetailMoviePage(Movie movie) {
    print(movie.title);
    Navigator.push(context, FadeTransactionPageRoute(new MovieDetail(movie)));
  }

  return GridView.builder(
    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        childAspectRatio: sizeImageWidth / sizeImageHeight),
    itemBuilder: (BuildContext context, int index) {
      final Movie movie = snapshot.data.results[index];
      final image = new ImageNetWork(
          'https://image.tmdb.org/t/p/w500${movie.poster_path}',
          imageMoviePosterPlaceHolder);
      final textName = Text(
        movie.title,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      );
      final column = Column(
        children: <Widget>[
          Hero(tag: '${movie.poster_path}', child: image),
          SizedBox(height: 10),
          textName
        ],
      );

      final GestureDetector gestureDetector = new GestureDetector(
        onTap: () => openDetailMoviePage(movie),
        child: column,
      );
      return gestureDetector;
    },
    itemCount: snapshot.data.results.length,
  );
}
