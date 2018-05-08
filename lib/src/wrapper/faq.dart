import 'package:distrowatch/distrowatch.dart';
import 'package:distrowatch/src/util/html_parser.dart';
import 'package:html/dom.dart';

List<Map<String, String>> parseFAQList(String html) {
  List<Package> listPackage = new List<Package>();
  Document document = parseStringToHTML(html);
  Element blockquote = document.getElementsByTagName('blockquote')[0];
  List<Element> textNodes = blockquote.children
    .where((Element e) => e.nodeType == Node.TEXT_NODE)
    .toList();
  nodes.forEach((Element node) { listPackage.add(parseFAQ(node)); });
  return listPackage;
}

Map<String, String> parseFAQ(Element el) {
  String name = el.children[0].text;
  String version = el.children[1].text;
  String description = el.children[2].text;
  String url = el.children[0].children[1].attributes['href'];
  return new Package(
    name: name,
    version: version,
    description: description,
    url: url,
  );
}