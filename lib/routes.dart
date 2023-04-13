import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/add_post_screen.dart';
import 'package:flutter_application_2/screens/dashboard_screen.dart';
import 'package:flutter_application_2/screens/list_favorites.dart';
import 'package:flutter_application_2/screens/list_popular_videos.dart';
import 'package:flutter_application_2/screens/register_screen.dart';
import 'package:flutter_application_2/screens/temas_preferencia.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => RegisterScreen(),
    '/dash': (BuildContext context) => DashboardScreen(),
    '/add': (BuildContext context) => AddPostScreen(),
    '/apiMovies': (BuildContext context) => ListPopularVideos(),
    '/apiMoviesFav': (BuildContext context) => ListFavorites(),
    '/temas': (BuildContext context) => TemasPage(),
  };
}
