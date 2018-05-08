import 'package:distrowatch/distrowatch.dart';
import 'package:distrowatch/src/util/html_parser.dart';
import 'package:html/dom.dart';

List<Package> parsePackageList(String html) {
  List<Package> listPackage = new List<Package>();
  Document document = parseStringToHTML(html);
  List<Element> nodes = document.querySelector('table.Auto').querySelectorAll('tr');
  nodes.removeRange(0, 1);
  nodes.forEach((Element node) { listPackage.add(parsePackage(node)); });
  return listPackage;
}

Package parsePackage(Element el) {
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