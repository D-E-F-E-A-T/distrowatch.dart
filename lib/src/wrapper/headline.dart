import 'package:distrowatch/distrowatch.dart';
import 'package:distrowatch/src/util/html_parser.dart';
import 'package:html/dom.dart';

List<Headline> parseHeadlineList(String html) {
  List<Headline> listHeadline = new List<Headline>();
  Document document = parseStringToHTML(html);
  List<Element> nodes = document.querySelectorAll('td.List tr');
  nodes.removeRange(0, 3);
  nodes.forEach((Element node) { listHeadline.add(parseHeadline(node)); });
  return listHeadline;
}

Headline parseHeadline(Element el) {
  bool isExternal = el.children[0].attributes['alt'] != 'Package release';
  List<String> fullDate = el.children[1].text.split('-');
  int year = int.parse(fullDate[0]);
  int month = int.parse(fullDate[1]);
  int day = int.parse(fullDate[2]);
  String title = el.children[2].text;
  return new Headline(
    isExternal: isExternal,
    date: new DateTime(year, month, day),
    title: title,
  );
}