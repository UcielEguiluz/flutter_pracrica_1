import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/theme_provider.dart';
import 'package:flutter_application_2/settings/styles_settings.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

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
        title: Text('Bueno para las cuentas'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdns-images.dzcdn.net/images/artist/3afa81d065245355854d803b55b66681/500x500.jpg'),
                ),
                accountName: Text('Natanael Cano'),
                accountEmail: Text('rancho@humilde.com.mx')),
            ListTile(
              onTap: () {},
              title: Text('practica 1'),
              subtitle: Text('Descripcion de la practica'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
            ),
            DayNightSwitcher(
              isDarkModeEnabled: isDarkModeEnabled,
              onStateChanged: (isDarkModeEnabled) {
                isDarkModeEnabled
                    ? theme.setthemeData(StylesSettings.darkTheme(context))
                    : theme.setthemeData(StylesSettings.lightTheme(context));
                this.isDarkModeEnabled = isDarkModeEnabled; 
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
