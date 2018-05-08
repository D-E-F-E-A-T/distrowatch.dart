import 'dart:async';
import 'package:distrowatch/distrowatch.dart';
import 'package:distrowatch/src/constants.dart';
import 'package:distrowatch/src/wrapper/news.dart';
import 'package:distrowatch/src/wrapper/distro.dart';
import 'package:distrowatch/src/wrapper/headline.dart';
import 'package:distrowatch/src/wrapper/package.dart';
import 'package:distrowatch/src/wrapper/faq.dart';
import 'package:distrowatch/src/util/html_parser.dart';
import 'package:http/http.dart' as http;

Future<List<News>> getNews() async {
  http.Response response = await http.get(URL);
  return parseNewsList(response.body);
}

Future<List<Distro>> getPageRanking(String dataspan) async {
  http.Response response = await http.get('${URL}/index.php?dataspan=${dataspan}');
  return parseDistroList(response.body);
}

Future<List<Distro>> getLatestReleases(String dataspan) async {
  http.Response response = await http.get(URL);
  return parseLatestReleases(response.body);
}

Future<List<Headline>> getHeadlines(String newstype, String month, String year) async {
  Map<String, dynamic> params = {
    'resource' : 'headlines',
    'newstype' : newstype,
    'targetmonth' : month,
    'targetyear' : year,
  };

  http.Response response = await http.get(buildURL('${URL}/dwres.php', params));
  return parseHeadlineList(response.body);
}

Future<List<Package>> getPackages() async {
  http.Response response = await http.get('${URL}/packages.php');
  return parsePackageList(response.body);
}

Future<List<Package>> getFAQ() async {
  Map<String, dynamic> params = {
    'resource' : 'faq',
  };

  http.Response response = await http.get(buildURL('${URL}/dwres.php', params));
  return parseFAQList(response.body);
}
