import 'package:distrowatch/distrowatch.dart';
import 'package:distrowatch/src/util/html_parser.dart';
import 'package:html/dom.dart';

List<Distro> parseDistroList(String html) {
  List<Distro> listDistro = new List<Distro>();
  Document document = parseStringToHTML(html);
  List<Element> nodes = document.querySelectorAll('td table.News')[22].querySelectorAll('tr');
  nodes.removeRange(0, 3);
  nodes.forEach((Element node) { listDistro.add(parseDistro(node)); });
  return listDistro;
}

Distro parseDistro(Element el) {
  String content = el.children[1].text;
  int hpd = int.parse(el.children[2].text);
  int position = int.parse(el.children[0].text);
  return new Distro(
    name: content,
    hpd: hpd,
    position: position,
  );
}