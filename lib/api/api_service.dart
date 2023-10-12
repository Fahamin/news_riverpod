import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/all_news_model.dart';
import '../model/news_channel_headlines_model.dart';

class ApiService {
  Future<AllNewsModel> fetchAllNews(String category) async {
    String newsUrl =
        'https://newsapi.org/v2/everything?q=$category&apiKey=8a5ec37e26f845dcb4c2b78463734448';
    final response = await http.get(Uri.parse(newsUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return AllNewsModel.fromJson(body);
    } else {
      throw Exception('Error');
    }
  }

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String newsChannel) async {
    String newsUrl =
        'https://newsapi.org/v2/top-headlines?sources=${newsChannel}&apiKey=8a5ec37e26f845dcb4c2b78463734448';
    final response = await http.get(Uri.parse(newsUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelHeadlinesModel.fromJson(body);
    } else {
      throw Exception('Error');
    }
  }
}

dynamic returnResponse(response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = response.data;
      return responseJson;
    case 400:
      throw "400";
    case 401:
      throw "401";
    case 403:
      throw "403";
    case 500:
      throw "500";
    default:
      throw 'Error occured while communication with server'
          ' with status code : ${response.statusCode}';
  }
}
