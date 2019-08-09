import 'package:flutter/material.dart';
import 'package:flutter_app/resources/app_constant.dart';
import 'package:flutter_app/resources/enum.dart';
import 'package:flutter_app/bloc/tv_bloc.dart';
import 'package:flutter_app/resources/utils.dart';
import 'package:flutter_app/model/tv.dart';
import 'package:flutter_app/ui/help.dart';
import 'package:flutter_app/ui/image_network.dart';
import 'package:flutter_app/ui/tv/tv_detail.dart';


// ignore: must_be_immutable
class TvTabScreen extends StatelessWidget {
  TvApiType tvApiType;

  TvTabScreen({Key key, this.tvApiType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (tvApiType) {
      case TvApiType.POPULAR:
        tvBloc.fetchAllTvPopular();
        break;
      case TvApiType.TOP_RATED:
        tvBloc.fetchAllTvTopRated();
        break;
      case TvApiType.ON_THE_AIR:
        tvBloc.fetchAllTvOnTv();
        break;
      case TvApiType.AIRING_TODAY:
        tvBloc.fetchAllTvAiringToday();
        break;
      default:
        break;
    }
    return Container(
      child: StreamBuilder(
          stream: tvBloc.tvShowList,
          builder: (context, AsyncSnapshot<TvResponse> snapshot) {
            if (snapshot.hasData) {
              return buildList(context, snapshot);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

Widget buildList(BuildContext context, AsyncSnapshot<TvResponse> snapshot) {
  double sizeImageWidth = getScreenWidth(context) / 3.0;
  double sizeImageHeight = 3.0 * sizeImageWidth / 2.0 + 50;

  openDetailMoviePage(Tv tv) {
    print(tv.name);
    Navigator.push(context, FadeTransactionPageRoute(new TvDetail(tv)));
  }

  return GridView.builder(
    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        childAspectRatio: sizeImageWidth / sizeImageHeight),
    itemBuilder: (BuildContext context, int index) {
      final Tv tv = snapshot.data.results[index];
      final image = new ImageNetWork(
          'https://image.tmdb.org/t/p/w500${tv.poster_path}',
          imageMoviePosterPlaceHolder);
      final textName = Text(
        tv.name,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      );
      final column = Column(
        children: <Widget>[image, SizedBox(height: 10), textName],
      );

      final GestureDetector gestureDetector = new GestureDetector(
        onTap: () => openDetailMoviePage(tv),
        child: column,
      );
      return gestureDetector;
    },
    itemCount: snapshot.data.results.length,
  );
}
