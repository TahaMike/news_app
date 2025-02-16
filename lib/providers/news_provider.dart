import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/news_repository.dart';
import '../data/news_model.dart';

final newsRepositoryProvider = Provider((ref) => NewsRepository());

final newsProvider = FutureProvider<List<NewsArticle>>((ref) async {
  final repository = ref.read(newsRepositoryProvider);
  return await repository.getNewsArticles();
});
