import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/popular_model.dart';
import 'package:flutter_application_2/network/api_popular.dart';
import 'package:flutter_application_2/screens/movie_detail.dart';
import 'package:flutter_application_2/widgets/item_popular.dart';

class ListPopularVideos extends StatefulWidget {
  const ListPopularVideos({super.key});

  @override
  State<ListPopularVideos> createState() => _ListPopularVideosState();
}

class _ListPopularVideosState extends State<ListPopularVideos> {
  ApiPopular? apiPopular;
  @override
  void initState() {
    super.initState();
    apiPopular = ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Popular'),
      ),
      body: FutureBuilder(
          future: apiPopular!.getAllPopular(),
          builder: (context, AsyncSnapshot<List<PopularModel>?> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: EdgeInsets.all(15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .9,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15
                ),
                itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                itemBuilder: (context, index) {
                  PopularModel model = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder:(BuildContext context) => MovieDetail(modelito: model) ));
                    },
                    child: ItemPopular(popularModel: snapshot.data![index]),
                  );
                  
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Tiene error'),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
