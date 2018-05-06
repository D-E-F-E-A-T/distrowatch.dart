import 'package:distrowatch/distrowatch.dart';
import 'package:distrowatch/src/util/html_parser.dart';
import 'package:html/dom.dart';

List<News> parseNewsList(String html) {
  List<News> listNews = new List<News>();
  Document document = parseStringToHTML(html);
  List<Element> nodes = document.querySelectorAll('td.News1 table.News');
  nodes.forEach((Element node) { listNews.add(parseNews(node)); });
  return listNews;
}

News parseNews(Element el) {
  List<String> dateFragments = el.children[0].children[0].children[0].text.split('-');
  String content = el.children[0].children[1].children[1].text;
  String title = el.children[0].children[0].children[1].text;
  int day = dateFragments.length > 1 ? int.parse(dateFragments[2]) : 1;
  int month = dateFragments.length > 1 ? int.parse(dateFragments[1]) : 1;
  int year = dateFragments.length > 1 ? int.parse(dateFragments[0]) : 1;
  return new News(
    content: content,
    date: new DateTime(year, month, day),
    logo: '',
    title: title,
  );
}