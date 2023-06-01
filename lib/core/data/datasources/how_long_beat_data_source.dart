import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/data/client/http_api_client.dart';
import 'package:video_game_completed/core/data/models/search_videogame_response.dart';
import 'package:video_game_completed/core/error/exceptions.dart';

abstract class HowLongBeatDataSource {
  Future<SearchVideogameResponse> searchVideoGame();
}

@injectable
class HowLongBeatDataSourceImpl extends HowLongBeatDataSource {
  HowLongBeatDataSourceImpl({required HttpApiClient httpApiClient})
      : _httpApiClient = httpApiClient;

  final HttpApiClient _httpApiClient;

  @override
  Future<SearchVideogameResponse> searchVideoGame() async {
    const data = {
      "searchType": "games",
      "searchTerms": ["assassin", "creed"]
    };
    final Response<String> response = await _httpApiClient.post(
        path: 'https://www.howlongtobeat.com/api/search',
        data: jsonEncode(data),
        headers: {
          'Origin': 'https://howlongtobeat.com/',
          'Referer': 'https://howlongtobeat.com/'
        });
    final String? jsonString = response.data;
    if (jsonString == null || jsonString.isEmpty) {
      throw const RemoteDataSourceException(
          message: "failed to find video games for");
    }
    Map<String, dynamic> mapJson = jsonDecode(jsonString);
    SearchVideogameResponse responseData = SearchVideogameResponse.fromJson(mapJson);
    return responseData;
  }
}
