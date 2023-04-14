import 'package:flutter/material.dart';
import 'package:flutter_application_2/database/database_helper.dart';
import 'package:flutter_application_2/models/popular_model.dart';
import 'package:flutter_application_2/network/api_popular.dart';

class MovieDetail extends StatelessWidget {
  ApiPopular apiPopular = ApiPopular();
  DatabaseHelper database = DatabaseHelper();

  final PopularModel modelito;

  MovieDetail({Key? key, required this.modelito}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imgPortada = Image(
        image: NetworkImage(
            'https://image.tmdb.org/t/p/w500/${modelito.posterPath}'),
        height: 200,
        width: 200,
        fit: BoxFit.contain);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 58, 64, 73),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500/${modelito.posterPath}'))),
          ),
          
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [imgPortada, info()],
            ),
          )
        ],
      ),
    );
  }

  Widget info() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            modelito.title.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            overflow: TextOverflow.fade,
          maxLines: 1,
          ),
          const Text('edctfdyasgvbijasndjkasndjkasdjklaskldjaskldjaskldjaskldjaskldjaskldj')
        ],
      ),
    );
  }
}
