import 'package:distrowatch/distrowatch.dart';

main() async {
  List<News> news = await getNews();
  news.forEach((News n) {
    print(n.title);
  });
}
