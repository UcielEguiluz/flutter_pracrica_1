import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final _formKey = GlobalKey<FormState>();

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? _image;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporaly = File(image.path);

    setState(() {
      this._image = imageTemporaly;
    });
  }

  Future getImageCam() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporaly = File(image.path);

    setState(() {
      this._image = imageTemporaly;
    });
  }

  @override
  Widget build(BuildContext context) {
    final btnAvatar = SocialLoginButton(
      backgroundColor: Colors.indigo,
      buttonType: SocialLoginButtonType.generalLogin,
      text: 'Añadir foto desde Galeria',
      onPressed: getImage,
    );
    final btnAvatarCam = SocialLoginButton(
      backgroundColor: Colors.indigo,
      buttonType: SocialLoginButtonType.generalLogin,
      text: 'Añadir foto desde Camara',
      onPressed: getImageCam,
    );
    final imgAvatar = _image != null
        ? Image.file(
            _image!,
            height: 100,
            fit: BoxFit.cover,
          )
        : Image.asset(
            'assets/logo.png',
            height: 100,
          );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        
        decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: .9,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/fondo.jpg'))),
        child: Align(
          alignment: Alignment.topCenter,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal:
                      50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0,25.0,8.0,8.0),
                      child: imgAvatar,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: btnAvatar,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: btnAvatarCam,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      
                      // The validator receives the text that the user has entered.
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black87),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.indigo)),
                          hintText: 'Correo'),
                      validator: (input) =>
                          input!.isValidEmail() ? null : "Checa tu email",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // The validator receives the text that the user has entered.
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black87),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.indigo)),
                          hintText: 'Nombre Completo'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Porfavor ingrese un texto';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // The validator receives the text that the user has entered.
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black87),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.indigo)),
                          hintText: 'Contraseña'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Porfavor ingrese un texto';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Procesando datos')),
                          );
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
