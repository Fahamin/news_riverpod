import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:untitled/api/api_service.dart';

import '../model/all_news_model.dart';
import '../model/news_channel_headlines_model.dart';

class NewsRepository {
  ApiService apiService = ApiService();

  Future<AllNewsModel> fetchNews(String category) async {
    final myApiResult = await apiService.fetchAllNews(category);
    return myApiResult;
  }

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String newsChannel) async {
    final myApiResult =
        await apiService.fetchNewsChannelHeadlinesApi(newsChannel);
    return myApiResult;
  }
}
