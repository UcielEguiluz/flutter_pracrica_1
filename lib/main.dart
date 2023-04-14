import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/flags_provider.dart';
import 'package:flutter_application_2/provider/theme_provider.dart';
import 'package:flutter_application_2/routes.dart';
import 'package:flutter_application_2/screens/onboarding_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final isDark = sharedPreferences.getBool('is_dark') ?? false;
  final isLight = sharedPreferences.getBool('is_light') ?? false;
  runApp(MyApp(isDark: isDark, isLight: isLight));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final bool isLight;
  const MyApp({
    super.key,
    required this.isDark,
    required this.isLight,});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(isDark, isLight)),
        ChangeNotifierProvider(create: (_) => FlagsProvider())
      ],
      child: const PMSNApp(),
    );
  }
}

class PMSNApp extends StatelessWidget {
  const PMSNApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: theme.currentTheme,
      routes: getApplicationRoutes(),
      home:
          OnboardingPage(), //login screen es un nuevo archivo dart donde se programa la pantalla de inicio de sesión
    );
  }
}
