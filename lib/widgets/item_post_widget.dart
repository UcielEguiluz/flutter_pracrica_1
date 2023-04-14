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
    const aang = CircleAvatar(
      backgroundImage: AssetImage('assets/logo.png'),
    );

    const txtUser = Text('El Nata');

    const datePost = Text('06-03-2023');

    const imgPost = Image(
      image: AssetImage('assets/fondo.jpg'),
      height: 150,
    );

    const space = SizedBox(
      width: 5,
    );

    final txtDesc = Text(objPostModel!.dscPost!);

    const laik = Icon(Icons.rate_review);

    FlagsProvider flag = Provider.of<FlagsProvider>(context);

    return Container(
      margin: const EdgeInsets.all(10),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        const Row(
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
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Confirmar borrado'),
                      content: const Text('Deseas borrar el post'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            database
                                .DELETE('tblPost', objPostModel!.idPost!)
                                .then((value) => flag.setflagListPost());
                            Navigator.pop(context);
                          },
                          child: const Text('Ok'),
                        ),
                        TextButton(onPressed: () {}, child: const Text('No'))
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                ))
          ],
        )
      ]),
    );
  }
}
