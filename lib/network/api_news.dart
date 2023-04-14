import 'dart:convert';

import 'package:flutter_application_2/models/news_model.dart';
import 'package:http/http.dart' as http;

class ApiNews {
  Uri link = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=b8ae4ae2a8d84394b56e0d80280f9e23');

  Future<List<NewsModel>> getAllNoticia() async {
    var result = await http.get(link);
    var listJson = jsonDecode(result.body)['articles'] as List;
    print(listJson);
    if (result.statusCode == 200) {
      return listJson.map((noticia) => NewsModel.fromMap(noticia)).toList();
    }
    return null!;
  }
}