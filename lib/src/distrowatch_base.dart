import 'dart:async';
import 'package:distrowatch/src/constants.dart';
import 'package:http/http.dart' as http;

Future<String> getNews() async {
  http.Response response = await http.get(URL);
  return response.body;
}
