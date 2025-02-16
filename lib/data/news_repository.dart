import 'package:news_app/data/news_services.dart';

import 'news_model.dart';

class NewsRepository {
  final NewsService _newsService = NewsService();

  Future<List<NewsArticle>> getNewsArticles() async {
    try {
      return await _newsService.fetchNews();
    } catch (e) {
      throw Exception("Error fetching articles: $e");
    }
  }
}
