import 'package:distrowatch/distrowatch.dart';
import 'package:distrowatch/src/util/html_parser.dart';
import 'package:html/dom.dart';

List<News> parseNewsList(String html) {
  List<News> listNews = new List<News>();
  Document document = parseStringToHTML(html);
  List<Element> nodes = document.getElementsByClassName('News');
  nodes.forEach((Element node) { listNews.add(parseNews(node)); });
  return listNews;
}

News parseNews(Element el) {
  List<String> dateFragments = el.children[0].children[0].children[0].text.split('-');
  int day = int.parse(dateFragments[2]);
  int month = int.parse(dateFragments[1]);
  int year = int.parse(dateFragments[0]);
  return new News(
    content: el.children[0].children[1].children[0].text,
    date: new DateTime(year, month, day),
    logo: '',
    title: el.children[0].children[0].children[0].text,
  );
}