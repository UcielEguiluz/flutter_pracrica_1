import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/dashboard_screen.dart';
import 'package:flutter_application_2/screens/register_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => RegisterScreen(),
    '/dash': (BuildContext context) => DashboardScreen()
  };
}
