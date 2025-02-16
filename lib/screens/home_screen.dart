import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  Future<void> _refreshNews(WidgetRef ref) async {
    ref.refresh(newsProvider); // Refresh the FutureProvider to fetch new data
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Latest News")),
      body: RefreshIndicator(
        onRefresh: () => _refreshNews(ref),
        child: newsState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text("Error: $err")),
          data: (articles) => ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return NewsCard(article: articles[index]);
            },
          ),
        ),
      ),
    );
  }
}
