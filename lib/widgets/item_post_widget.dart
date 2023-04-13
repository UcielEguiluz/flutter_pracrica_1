import 'package:flutter/material.dart';
import 'package:flutter_application_2/database/database_helper.dart';
import 'package:flutter_application_2/models/post_model.dart';
import 'package:provider/provider.dart';

import '../provider/flags_provider.dart';

class ItemPostWidget extends StatelessWidget {
  ItemPostWidget({super.key, this.objPostModel});

  PostModel? objPostModel;
  DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    final aang = CircleAvatar(
      backgroundImage: AssetImage('assets/logo.png'),
    );

    final txtUser = Text('El Nata');

    final datePost = Text('06-03-2023');

    final imgPost = Image(
      image: AssetImage('assets/fondo.jpg'),
      height: 150,
    );

    final space = SizedBox(
      width: 5,
    );

    final txtDesc = Text(objPostModel!.dscPost!);

    final laik = Icon(Icons.rate_review);

    FlagsProvider flag = Provider.of<FlagsProvider>(context);

    return Container(
      margin: const EdgeInsets.all(10),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Row(
          children: [aang, space, txtUser, space, datePost],
        ),
        Row(
          children: [imgPost, space, txtDesc],
        ),
        Row(
          children: [
            space,
            laik,
            Expanded(child: Container()),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/add', arguments: objPostModel);
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Confirmar borrado'),
                      content: Text('Deseas borrar el post'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            database
                                .DELETE('tblPost', objPostModel!.idPost!)
                                .then((value) => flag.setflagListPost());
                            Navigator.pop(context);
                          },
                          child: Text('Ok'),
                        ),
                        TextButton(onPressed: () {}, child: const Text('No'))
                      ],
                    ),
                  );
                },
                icon: Icon(
                  Icons.delete,
                ))
          ],
        )
      ]),
    );
  }
}
