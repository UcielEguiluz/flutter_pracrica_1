import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_application_2/screens/login_screen.dart';


import '../widgets/card_planet.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final data = [
    CardPlanetData(
      title: "TECNMX Celaya",
      subtitle:
          "El Tecnológico Nacional de México en Celaya fue fundado en 1958",
      image: const AssetImage("assets/images/img-1.png"),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.pink,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/bg-1.json"),
    ),
    CardPlanetData(
      title: "Ingeniería en Sistemas Computacionales",
      subtitle:
          "El y la Ingeniero/a en Sistemas Computacionales, es bueno pa todo porque es CHIDO.",
      image: const AssetImage("assets/images/img-2.png"),
      backgroundColor: Colors.white,
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      background: LottieBuilder.asset("assets/animation/bg-2.json"),
    ),
    CardPlanetData(
      title: "Misión",
      subtitle:
          "Pura ingenieria, abajo la licenciatura con casco.",
      image: const AssetImage(
        "assets/images/img-3.png",
      ),
      backgroundColor: Color.fromARGB(255, 42, 5, 187),
      titleColor: Color.fromARGB(255, 0, 243, 252),
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/bg-3.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return CardPlanet(data: data[index]);
        },
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()), 
          );
        },
      ),
    );
  }
}
