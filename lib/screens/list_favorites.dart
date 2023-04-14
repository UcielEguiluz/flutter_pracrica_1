import 'package:flutter/material.dart';
import 'package:flutter_application_2/database/database_helper.dart';
import 'package:flutter_application_2/models/popular_model.dart';
import 'package:flutter_application_2/screens/movie_detail.dart';
import 'package:flutter_application_2/widgets/item_popular.dart';

class ListFavorites extends StatefulWidget {
  const ListFavorites({super.key});

  @override
  State<ListFavorites> createState() => _ListFavoritesState();
}

class _ListFavoritesState extends State<ListFavorites> {
  DatabaseHelper? database;

  @override
  void initState() {
    super.initState();
    database = DatabaseHelper();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text('List Favorites'),
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: database!.GETALLpopular(),
            builder: (context, AsyncSnapshot<List<PopularModel>?> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                return const Center(
                  child: Text('Tiene error'),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                onPressed: (){},
                icon: const Icon(Icons.favorite),
                label: const Text('Favoritos')))],
      ),
    );
  }
  }
