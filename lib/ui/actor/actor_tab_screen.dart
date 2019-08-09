import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/actor_bloc.dart';
import 'package:flutter_app/model/actor.dart';
import 'package:flutter_app/resources/app_constant.dart';
import 'package:flutter_app/resources/utils.dart';
import 'package:flutter_app/ui/image_network.dart';


class ActorTabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    actorBloc.fetchActorPopular();
    return Container(
      child: StreamBuilder(
          stream: actorBloc.actorList,
          builder: (context, AsyncSnapshot<ActorResponse> snapshot) {
            if (snapshot.hasData) {
              return buildListActor(context, snapshot);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget buildListActor(
      BuildContext context, AsyncSnapshot<ActorResponse> snapshot) {
    double sizeImageWidth = getScreenWidth(context) / 3.0;
    double sizeImageHeight = 3.0 * sizeImageWidth / 2.0 + 50;

    return GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2.0,
          childAspectRatio: sizeImageWidth / sizeImageHeight),
      itemBuilder: (BuildContext context, int index) {
        final Actor actor = snapshot.data.results[index];
        final image = new ImageNetWork(
            'https://image.tmdb.org/t/p/w500${actor.profilePath}',
            imageMoviePosterPlaceHolder);
        final textName = Text(
          actor.name,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        );
        final column = Column(
          children: <Widget>[image, SizedBox(height: 10), textName],
        );

        final GestureDetector gestureDetector = new GestureDetector(
          onTap: () => openDetailMoviePage(actor),
          child: column,
        );
        return gestureDetector;
      },
      itemCount: snapshot.data.results.length,
    );
  }

  openDetailMoviePage(Actor actor) {
    print(actor.name);
  }
}
