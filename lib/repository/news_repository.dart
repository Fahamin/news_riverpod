import 'package:flutter/widgets.dart';
import 'package:untitled/api/api_service.dart';

import '../model/all_news_model.dart';
import '../model/news_channel_headlines_model.dart';

class NewsRepository {
  ApiService apiService = ApiService();

  Future<AllNewsModel> fetchAllNews(String category) async {
    final body = await apiService.fetchAllNews(category);
    debugPrint(body.toString());
    return AllNewsModel.fromJson(body);
  }

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(String newsChannel) async {
    final body = await apiService.fetchNewsChannelHeadlinesApi(newsChannel);
    return NewsChannelHeadlinesModel.fromJson(body);
  }

}
