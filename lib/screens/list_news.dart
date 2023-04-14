import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/news_model.dart';
import 'package:flutter_application_2/network/api_news.dart';

class ListNews extends StatefulWidget {
  const ListNews({super.key});

  @override
  State<ListNews> createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  ApiNews? apiNews;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiNews = ApiNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listado de noticias")),
      body: FutureBuilder(
          future: apiNews!.getAllNoticia(),
          builder: (context, AsyncSnapshot<List<NewsModel>?> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    NewsModel news = snapshot.data![index];
                    String imagen = news.urlToImage != null
                        ? news.urlToImage!
                        : 'https://img.freepik.com/free-vector/global-earth-blue-technology-digital-background-design_1017-27075.jpg?w=740&t=st=1681497328~exp=1681497928~hmac=e13be1f98bb869b94610d6e48515b383512688ab230e82c73c032e42c6b78d3a';
                    return ListTile(
                      title: Text(news.title.toString()),
                      leading: Hero(
                        tag: index,
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Image.network(imagen),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SecondPage(
                                  heroTag: index,
                                  imagen: imagen,
                                  contenido: news.description!,
                                )));
                      },
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class SecondPage extends StatelessWidget {
  final int heroTag;
  final String imagen;
  final String contenido;
  const SecondPage({required this.heroTag, required this.imagen,required this.contenido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Extendido")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: Image.network(imagen),
              ),
            ),
          ),
          Expanded(
            child: Text(
              contenido,
              //style: Theme.of(context).textTheme.headline5,
            ),
          )
        ],
      ),
    );
  }
}