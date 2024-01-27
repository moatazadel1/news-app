import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=206f8f70198f4513a4ca24a1b16f123f&category=$category');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        articlesList.add(ArticleModel.fromJson(article));
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
