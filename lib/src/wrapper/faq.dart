import 'package:distrowatch/src/util/html_parser.dart';
import 'package:html/dom.dart';

Map<String, String> parseFAQMap(String html) {
  Document document = parseStringToHTML(html);
  Element blockquote = document.getElementsByTagName('blockquote')[0];
  // TODO: fix fetching
  List<Element> textNodes = blockquote.children
    .where((Element e) => e.nodeType == Node.TEXT_NODE)
    .toList();
  Map<String, String> mapFAQ = parseFAQ(textNodes);
  return mapFAQ;
}

Map<String, String> parseFAQ(List<Element> el) {
  Map<String, String> faq = new Map<String, String>();
  for (var i = 0; i < el.length-2; i+2) {
    faq[el[i].text] = faq[el[i+1].text];
  }
  // String name = el.children[0].text;
  // String version = el.children[1].text;
  // String description = el.children[2].text;
  // String url = el.children[0].children[1].attributes['href'];
  return faq;
}