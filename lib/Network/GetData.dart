import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:movie_search/Utils/Constants.dart';
import 'package:movie_search/Models/ItemsModel.dart';

class GetData {
  static Future<List<ItemsModel>> fetchData(String search) async {
    String url = BASE_URL + "?apikey=" + API_KEY + "&s=" + search;
    final response = await http.get(Uri.parse(url));
    log(url);
    if (response.statusCode == 200) {
      return fetchRatingAndGenre(json.decode(response.body)['Search'] as List);
    } else {
      throw Exception('Failed to load movie');
    }
  }

  static Future<List<ItemsModel>> fetchRatingAndGenre(
      List<dynamic> decode) async {
    List<ItemsModel> resultList = [];
    for (dynamic i in decode) {
      String url = BASE_URL + "?apikey=" + API_KEY + "&i=" + i['imdbID'];
      log(url);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        resultList.add(ItemsModel.fromJson(json.decode(response.body)));
      } else {
        throw Exception('Failed to load movie');
      }
    }
    return resultList;
  }
}
