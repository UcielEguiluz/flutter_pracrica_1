import 'package:flutter/material.dart';
import 'package:flutter_application_2/database/database_helper.dart';
import 'package:flutter_application_2/models/post_model.dart';
import 'package:flutter_application_2/provider/flags_provider.dart';
import 'package:flutter_application_2/widgets/item_post_widget.dart';
import 'package:provider/provider.dart';

class ListPost extends StatefulWidget {
  const ListPost({super.key});
  @override
  State<ListPost> createState() => _ListPostState();
}

DatabaseHelper? database;

class _ListPostState extends State<ListPost> {
  @override
  void initState() {
    super.initState();
    database = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    flag.getflagListPost();
    

    return FutureBuilder(
      future: flag.getflagListPost()==true ?database!.GETALLPOST():database!.GETALLPOST(),
      builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var objPostModel = snapshot.data![index];
              return ItemPostWidget(objPostModel: objPostModel);
            },
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text("Ocurrio un error"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
