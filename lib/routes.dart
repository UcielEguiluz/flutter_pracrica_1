import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/add_post_screen.dart';
import 'package:flutter_application_2/screens/dashboard_screen.dart';
import 'package:flutter_application_2/screens/list_favorites.dart';
import 'package:flutter_application_2/screens/list_news.dart';
import 'package:flutter_application_2/screens/list_popular_videos.dart';
import 'package:flutter_application_2/screens/register_screen.dart';
import 'package:flutter_application_2/screens/temas_preferencia.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => const RegisterScreen(),
    '/dash': (BuildContext context) => const DashboardScreen(),
    '/add': (BuildContext context) => AddPostScreen(),
    '/apiMovies': (BuildContext context) => const ListPopularVideos(),
    '/apiMoviesFav': (BuildContext context) => const ListFavorites(),
    '/temas': (BuildContext context) => const TemasPage(),
    '/news': (BuildContext context) => const ListNews(),
  };
}
