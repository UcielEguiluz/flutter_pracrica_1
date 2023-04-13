import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/theme_provider.dart';
import 'package:flutter_application_2/settings/styles_settings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TemasPage extends StatefulWidget {
  const TemasPage({super.key});

  @override
  State<TemasPage> createState() => _TemasPageState();
}

class _TemasPageState extends State<TemasPage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias temas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  theme.TemaClaro();
                },
                child: Text("Tema Claro")),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  theme.TemaOscuro();
                },
                child: Text("Tema Oscuro")),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  theme.TemaPersonalizado();
                },
                child: Text("Tema Personalizado")),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
