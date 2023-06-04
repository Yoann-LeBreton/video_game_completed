import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/data/client/http_api_client.dart';
import 'package:video_game_completed/core/data/models/search_videogame_response.dart';
import 'package:video_game_completed/core/error/exceptions.dart';
import 'package:video_game_completed/core/utils/constants/url_constants.dart';
import 'package:video_game_completed/core/utils/enums/search_filter_enums.dart';


abstract class HowLongBeatDataSource {
  Future<SearchVideogameResponse> searchVideoGame(
      int pageResult,
      String searchText,
      SearchFilterSortBy sortBy, SearchFilterPlatform platform);
}

@injectable
class HowLongBeatDataSourceImpl extends HowLongBeatDataSource {
  HowLongBeatDataSourceImpl({required HttpApiClient httpApiClient})
      : _httpApiClient = httpApiClient;

  final HttpApiClient _httpApiClient;

  @override
  Future<SearchVideogameResponse> searchVideoGame(int pageResult, String searchText,
      SearchFilterSortBy sortBy, SearchFilterPlatform platform) async {
    var split = searchText.split(' ');
    final data = {
      "searchType": "games",
      "searchTerms": [...split],
      "searchPage": pageResult,
      "size": 20,
      "searchOptions": {
        "games": {
          "userId": 0,
          "platform": platform.queryCategory,
          "sortCategory": sortBy.queryCategory,
          "rangeCategory": "main",
          "rangeTime": {"min": 0, "max": 0},
          "gameplay": {"perspective": "", "flow": "", "genre": ""},
          "modifier": ""
        },
        "users": {"sortCategory": "postcount"},
        "filter": "",
        "sort": 0,
        "randomizer": 0
      }
    };
    final Response<String> response = await _httpApiClient.post(
        path:
            '${UrlConstants.howLongBeatBaseUrl}${UrlConstants.howLongBeatSearchPath}',
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
    SearchVideogameResponse responseData =
        SearchVideogameResponse.fromJson(mapJson);
    return responseData;
  }
}
