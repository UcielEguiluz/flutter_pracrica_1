import 'package:flutter/material.dart';
import 'package:flutter_application_2/responsive.dart';
import 'package:flutter_application_2/widgets/loading_modal.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//lo debajo son text from donde se ponen los recuadros donde van tanto el correo como la contraseña
//se le puso OutlineInputBorder para poner la linea que rodea los bordes de la caja de texto
class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final txtEmail = TextFormField(
    decoration: const InputDecoration(
        label: Text('Tu correo'), border: OutlineInputBorder()),
  );
  final txtPass = TextFormField(
    decoration: const InputDecoration(
        label: Text('Tu contrasenia'), border: OutlineInputBorder()),
  );

  final spaceHorizontal = SizedBox(
    height: 10,
  );
  //Aqui debajo se importó una "libreria" de dev.net que agrega botonos para login de diferentes medias, como google, facebook, etc.

  final btnGoogle = SocialLoginButton(
      buttonType: SocialLoginButtonType.google, onPressed: () {});
  final btnFace = SocialLoginButton(
      buttonType: SocialLoginButtonType.facebook, onPressed: () {});
  final btnGit = SocialLoginButton(
      buttonType: SocialLoginButtonType.github, onPressed: () {});

  final imgLogo = Image.asset(
    'assets/logo.png',
    height: 200,
  );

  @override
  Widget build(BuildContext context) {
    final txtRegister = Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Text(
            'Crear cuenta',
            style:
                TextStyle(fontSize: 18, decoration: TextDecoration.underline),
          )),
    );

    final btnEmail = SocialLoginButton( 
        buttonType: SocialLoginButtonType.generalLogin,
        onPressed: () {
          isLoading = true;
          setState(() {});
          Future.delayed(Duration(milliseconds: 4000)).then((value) {
            isLoading = false;
            setState(() {});
            Navigator.pushNamed(context, '/dash');
          });
        });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: .9,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/fondo.jpg'))),
            child: Responsive(
              mobile: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal:
                        50), //aqui se le da un padding horizontal simetrico a las cajas de texto para que estas no abarquen toda la pantalla de forma horizontal
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        txtEmail,
                        spaceHorizontal,
                        txtPass,
                        spaceHorizontal,
                        btnEmail,
                        spaceHorizontal,
                        btnGoogle,
                        spaceHorizontal,
                        btnFace,
                        spaceHorizontal,
                        btnGit,
                        spaceHorizontal,
                        txtRegister
                      ],
                    ),
                    Positioned(
                      top: 25,
                      child: imgLogo,
                    )
                  ],
                ),
              ),
              desktop: Row(
                children: [
                  Expanded(child: imgLogo),
                  Expanded(child: 
                      SizedBox(
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,4.0,100.0,1.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              txtEmail,
                              spaceHorizontal,
                              txtPass,
                              spaceHorizontal,
                              btnEmail,
                              spaceHorizontal,
                              btnGoogle,
                              spaceHorizontal,
                              btnFace,
                              spaceHorizontal,
                              btnGit,
                              spaceHorizontal,
                              txtRegister,
                            ],
                          ),
                        ),
                      )
                    ,
                  )
                ],
              )
              
            ),
          ),
          isLoading ? const LoadingModalWidget() : Container()
        ],
      ),
    );
  }
}
