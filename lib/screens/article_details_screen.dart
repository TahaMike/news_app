import 'package:flutter/material.dart';
import 'package:news_app/data/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw "Could not launch $url";
  }
}



class ArticleDetailsScreen extends StatelessWidget {
  final NewsArticle article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        article.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Published: ${article.publicationDate}",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              "Category: ${article.sectionName}",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Text(
              article.summary,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => launchURL(article.webUrl), // Use the method here
              child:  const Text(
                "Read Full Article",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Close"),
        ),
      ],
    );
  }
}
