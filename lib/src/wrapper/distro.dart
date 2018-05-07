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

List<Distro> parseLatestReleases(String html) {
  List<Distro> listDistro = new List<Distro>();
  Document document = parseStringToHTML(html);
  List<Element> nodes = document.querySelectorAll('td table.News')[0].querySelectorAll('tr');
  nodes.removeRange(0, 1);
  nodes.forEach((Element node) { listDistro.add(parseRelease(node)); });
  return listDistro;
}

Distro parseDistro(Element el) {
  String name = el.children[1].text;
  int hpd = int.parse(el.children[2].text);
  int position = int.parse(el.children[0].text);
  return new Distro(
    name: name,
    hpd: hpd,
    position: position,
  );
}

Distro parseRelease(Element el) {
  List<String> nameAndVersion = el.children[1].text.split(' • ');
  List<String> fullDate = el.children[0].text.split('/');
  int month = int.parse(fullDate[0]);
  int day = int.parse(fullDate[1]);
  return new Distro(
    name: nameAndVersion[0],
    lastVersion: nameAndVersion[1],
    lastVersionDate: new DateTime(new DateTime.now().year, month, day),
  );
}