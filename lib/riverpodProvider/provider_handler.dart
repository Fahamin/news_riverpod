import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/model/news_channel_headlines_model.dart';
import 'package:untitled/repository/news_repository.dart';

import '../model/all_news_model.dart';

final providerAllNews =
    FutureProvider.family<AllNewsModel, String>((ref, cat) async {
  //NewsRepository newsRepository = NewsRepository();

  return NewsRepository().fetchAllNews(cat);
});

final providerHeadLines =
    FutureProvider.family<NewsChannelHeadlinesModel, String>(
        (ref, cat) async {

  return NewsRepository().fetchNewsChannelHeadlinesApi(cat);
});
