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
  final espacio = SizedBox(
    height: 10,
  );
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
            SizedBox.fromSize(
              size: Size(80, 80),
              child: ClipOval(
                child: Material(
                  color: Colors.blueAccent,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      theme.TemaClaro();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.wb_sunny_outlined), Text("Claro")],
                    ),
                  ),
                ),
              ),
            ),
            espacio,
            SizedBox.fromSize(
              size: Size(80, 80),
              child: ClipOval(
                child: Material(
                  color: Colors.black54,
                  child: InkWell(
                    splashColor: Colors.black12,
                    onTap: () {
                      theme.TemaOscuro();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.nightlight_outlined),
                        Text("Oscuro")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            espacio,
            SizedBox.fromSize(
              size: Size(80, 80),
              child: ClipOval(
                child: Material(
                  color: Color.fromARGB(255, 4, 155, 24),
                  child: InkWell(
                    splashColor: Color.fromARGB(255, 82, 198, 98),
                    onTap: () {
                      theme.TemaPersonalizado();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.brush_outlined),
                        Text("Custom")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
