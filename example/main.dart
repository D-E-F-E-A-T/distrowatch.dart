import 'package:distrowatch/distrowatch.dart';

main() async {
  // List<News> news = await getNews();
  // news.forEach((News n) {
  //   print(n.title);
  // });

  // List<Distro> items = await getPageRanking('2017');
  // items.forEach((Distro item) {
  //   print('${item.position} - ${item.name} => ${item.hpd}');
  // });

  // List<Distro> items = await getLatestReleases('2017');
  // items.forEach((Distro item) {
  //   print('${item.name} - ${item.lastVersion} => ${item.lastVersionDate}');
  // });

  List<Headline> items = await getHeadlines('All', '2017', '01');
  items.forEach((Headline item) {
    print('${item.title} - ${item.date}');
  });
}
