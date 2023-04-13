import 'package:flutter/material.dart';
import 'package:flutter_application_2/database/database_helper.dart';
import 'package:flutter_application_2/models/actor_model.dart';
import 'package:flutter_application_2/models/popular_model.dart';
import 'package:flutter_application_2/network/api_popular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetail extends StatelessWidget {
  ApiPopular apiPopular = ApiPopular();
  DatabaseHelper database = DatabaseHelper();

  final PopularModel modelito;

  MovieDetail({Key? key, required this.modelito}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double rateo = 0;
    if (modelito.voteAverage != null) {
      rateo = modelito.voteAverage!;
    } else {
      rateo = 0; //return value if str is null
    }
    final imgPortada = Image(
        image: new NetworkImage(
            'https://image.tmdb.org/t/p/w500/${modelito.posterPath}'),
        height: 200,
        width: 200,
        fit: BoxFit.contain);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Hero(
            tag: modelito.id!,
            child: Container(
              decoration: new BoxDecoration(
                  color: Color.fromARGB(255, 58, 64, 73),
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      image: new NetworkImage(
                          'https://image.tmdb.org/t/p/w500/${modelito.posterPath}'))),
            ),
          ),
          Positioned(
              top: 350,
              child: Container(
                height: 250,
                width: queryData.size.width,
                color: Colors.indigoAccent,
                child: FutureBuilder(
                    future: apiPopular.getVideo(modelito.id!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return YoutubePlayer(
                          controller: YoutubePlayerController(
                              initialVideoId: snapshot.data.toString(),
                              flags: YoutubePlayerFlags(
                                autoPlay: true,
                                mute: false,
                                controlsVisibleAtStart: false,
                              )),
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.amber,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              )),
          Positioned(
            top: 180,
            child: Container(
              height: 150,
              width: queryData.size.width,
              //color: Colors.purple,
              child: FutureBuilder<List<ActorModel>?>(
                  future: apiPopular.getAllActors(modelito),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            ActorModel actor = snapshot.data![index];
                            return CartaActor(
                              actor.name.toString(),
                              actor.profilePath != null
                                  ? 'https://image.tmdb.org/t/p/original${actor.profilePath}'
                                  : 'https://www.personality-insights.com/wp-content/uploads/2017/12/default-profile-pic-e1513291410505.jpg',
                              actor.character!,
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 25),
              width: queryData.size.width, //parent size
              height: 150, //parent size
              child: LayoutBuilder(builder: (context, size) {
                return Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new NetworkImage(
                                  'https://image.tmdb.org/t/p/w500/${modelito.posterPath}'))),
                      height: size.maxHeight,
                      width: size.maxHeight,
                    ),
                    Expanded(
                      child: Column(children: [
                        Expanded(
                          child: Container(
                            child: Text(modelito.title.toString(),
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: SingleChildScrollView(
                                child: Text(modelito.overview.toString())),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: RatingBar(
                              initialRating: rateo / 2,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                  full: const Icon(Icons.star_rounded,
                                      color: Colors.yellowAccent),
                                  half: const Icon(
                                    Icons.star_border_purple500_rounded,
                                    color: Colors.yellowAccent,
                                  ),
                                  empty: const Icon(
                                    Icons.star_border_rounded,
                                    color: Colors.yellowAccent,
                                  )),
                              ignoreGestures: true,
                              onRatingUpdate: (value) {},
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget CartaActor(
      final String name, final String photoUrl, final String character) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 10),
      child: Column(
        children: [
          ClipOval(
            child: Image.network(
              photoUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            'As: $character',
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
