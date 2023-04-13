import 'package:flutter/material.dart';
import 'package:flutter_application_2/database/database_helper.dart';
import 'package:flutter_application_2/models/post_model.dart';
import 'package:flutter_application_2/provider/flags_provider.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});

  DatabaseHelper databaseHelper = DatabaseHelper();
  PostModel? objPostModel;

  @override
  Widget build(BuildContext context) {
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    final txtConPost = TextEditingController();
    if (ModalRoute.of(context)!.settings.arguments != null) {
      objPostModel = ModalRoute.of(context)!.settings.arguments as PostModel;
      txtConPost.text = objPostModel!.dscPost!;
    }

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(15),
          height: 350,
          decoration: BoxDecoration(
              color: Colors.lightGreen,
              border: Border.all(color: Colors.black)),
          child: Column(
            children: [
              objPostModel == null ? Text('Add Post') : Text('Update Post'),
              TextFormField(
                maxLines: 8,
                controller: txtConPost,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (objPostModel == null) {
                      databaseHelper.INSERT('tblPost', {
                        'dscPost': txtConPost.text,
                        'datePost': DateTime.now().toString(),
                      }).then((value) {
                        var msg = value > 0
                            ? 'Registro insertado'
                            : 'Ocurrio un error';

                        var snackBar = SnackBar(content: Text(msg));
                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    } else {
                      databaseHelper.UPDATE('tblPost', {
                        'idPost': objPostModel!.idPost,
                        'dscPost': txtConPost.text,
                        'datePost': DateTime.now().toString(),
                      }).then((value) {
                        var msg = value > 0
                            ? 'Registro actualizado'
                            : 'Ocurrio un error';

                        var snackBar = SnackBar(content: Text(msg));
                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    }
                    flag.setflagListPost();
                  },
                  child: Text('Save Post'))
            ],
          ),
        ),
      ),
    );
  }
}
