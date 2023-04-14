import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/theme_provider.dart';
import 'package:flutter_application_2/screens/list_post.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bueno para las cuentas'),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: const ListPost(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((value) {
            setState(() {});
          });
        },
        label: const Text('add post'),
        icon: const Icon(Icons.add_comment),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdns-images.dzcdn.net/images/artist/3afa81d065245355854d803b55b66681/500x500.jpg'),
                ),
                accountName: Text('Natanael Cano'),
                accountEmail: Text('rancho@humilde.com.mx')), 
            ListTile(
              onTap: () {},
              title: const Text('practica 1'),
              subtitle: const Text('Descripcion de la practica'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {Navigator.pushNamed(context, '/apiMovies');},
              title: const Text('Popular de API'),
              subtitle: const Text('Ver las peliculas mas populares de la api'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.movie),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/temas');
              },
              title: const Text('Preferencias Temas'),
              subtitle: const Text("Selecciona la preferencia de tu tema"),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/news');
              },
              title: const Text('Ver las oticias'),
              subtitle: const Text("Ps ver noticias"),
              leading: const Icon(Icons.newspaper),
              trailing: const Icon(Icons.chevron_right),
            )

            /*DayNightSwitcher(
              isDarkModeEnabled: isDarkModeEnabled,
              onStateChanged: (isDarkModeEnabled) {
                isDarkModeEnabled
                    ? theme.setthemeData(StylesSettings.darkTheme(context))
                    : theme.setthemeData(StylesSettings.lightTheme(context));
                this.isDarkModeEnabled = isDarkModeEnabled;
                setState(() {});
              },
            )*/
          ],
        ),
      ),
    );
  }
}
