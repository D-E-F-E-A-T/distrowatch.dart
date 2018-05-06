import 'dart:async';
import 'package:distrowatch/distrowatch.dart';
import 'package:distrowatch/src/constants.dart';
import 'package:distrowatch/src/wrapper/news.dart';
import 'package:http/http.dart' as http;

Future<List<News>> getNews() async {
  http.Response response = await http.get(URL);
  return parseNewsList(response.body);
}
