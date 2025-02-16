import 'dart:convert';

class NewsArticle {
  final String title;
  final String summary;
  final String sectionName; // Category
  final String webUrl; // Full article link
  final String publicationDate; // Add this field

  NewsArticle({
    required this.title,
    required this.summary,
    required this.sectionName,
    required this.webUrl,
    required this.publicationDate, // Initialize new field
  });

  // Factory method to create an object from JSON
  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json["webTitle"] ?? "No Title",
      summary: json["fields"]?["trailText"] ?? "No Summary Available",
      sectionName: json["sectionName"] ?? "General",
      webUrl: json["webUrl"] ?? "",
      publicationDate: json["webPublicationDate"] ?? "Unknown Date", // Fetch from API
    );
  }

  // Convert JSON list to a list of NewsArticle objects
  static List<NewsArticle> fromJsonList(String jsonString) {
    final Map<String, dynamic> decodedData = jsonDecode(jsonString);
    final List<dynamic> results = decodedData['response']['results'];

    return results.map((article) => NewsArticle.fromJson(article)).toList();
  }
}
