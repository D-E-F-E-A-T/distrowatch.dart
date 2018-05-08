import 'package:distrowatch/distrowatch.dart';
import 'package:distrowatch/src/util/html_parser.dart';
import 'package:html/dom.dart';

Map<String, String> parseFAQList(String html) {
  Document document = parseStringToHTML(html);
  Element blockquote = document.getElementsByTagName('blockquote')[0];
  List<Element> textNodes = blockquote.children
    .where((Element e) => e.nodeType == Node.TEXT_NODE)
    .toList();
  Map<String, String> mapFAQ = parseFAQ(textNodes);
  return mapFAQ;
}

Map<String, String> parseFAQ(List<Element> el) {
  // String name = el.children[0].text;
  // String version = el.children[1].text;
  // String description = el.children[2].text;
  // String url = el.children[0].children[1].attributes['href'];
  return new Map<String, String>();
}