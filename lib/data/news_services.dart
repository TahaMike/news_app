import 'package:http/http.dart' as http;
import 'package:news_app/api_key.dart';
import 'news_model.dart';

class NewsService {
  static const String _baseUrl = "https://content.guardianapis.com/search";
  static final String _apiKey = api_key; // Replace with your API Key

  Future<List<NewsArticle>> fetchNews() async {
    final Uri url = Uri.parse("$_baseUrl?api-key=$_apiKey");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return NewsArticle.fromJsonList(response.body);
      } else {
        throw Exception("Failed to load news. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching news: $e");
    }
  }
}
