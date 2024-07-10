import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class NowPlayingCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Now Playing',
      apiUrl:
          'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1\'',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? nowPlayingResults(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class PopularMoviesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Popular Movies',
      apiUrl:
          'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? popularMoviesResults(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class PopularTvShowsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Popular Tv Shows',
      apiUrl: 'https://api.themoviedb.org/3/tv/popular?language=en-US&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class MovieDetailsCall {
  static Future<ApiCallResponse> call({
    int? movieId = 940721,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Movie Details',
      apiUrl: 'https://api.themoviedb.org/3/movie/$movieId?language=en-US',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? genres(dynamic response) => (getJsonField(
        response,
        r'''$.genres[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class MovieCastsCall {
  static Future<ApiCallResponse> call({
    int? movieId = 940721,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Movie Casts',
      apiUrl:
          'https://api.themoviedb.org/3/movie/$movieId/credits?language=en-US',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? casts(dynamic response) => getJsonField(
        response,
        r'''$.cast''',
        true,
      ) as List?;
}

class MovieReviewsCall {
  static Future<ApiCallResponse> call({
    int? movieId = 200,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Movie Reviews',
      apiUrl:
          'https://api.themoviedb.org/3/movie/$movieId/reviews?language=en-US&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class SimilarMoviesCall {
  static Future<ApiCallResponse> call({
    int? movieId = 940721,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Similar Movies',
      apiUrl:
          'https://api.themoviedb.org/3/movie/$movieId/similar?language=en-US&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class TvShowsDetailsCall {
  static Future<ApiCallResponse> call({
    int? tvId = 2734,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Tv Shows Details',
      apiUrl: 'https://api.themoviedb.org/3/tv/$tvId?language=en-US',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? genres(dynamic response) => (getJsonField(
        response,
        r'''$.genres[0:2]..name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic lastEpisodeToAir(dynamic response) => getJsonField(
        response,
        r'''$.last_episode_to_air''',
      );
  static List? seasons(dynamic response) => getJsonField(
        response,
        r'''$.seasons''',
        true,
      ) as List?;
}

class TvSeasonsCall {
  static Future<ApiCallResponse> call({
    int? tvId = 1416,
    int? seasonNumber = 1,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Tv Seasons',
      apiUrl:
          'https://api.themoviedb.org/3/tv/$tvId/season/$seasonNumber?language=en-US',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? episodes(dynamic response) => getJsonField(
        response,
        r'''$.episodes''',
        true,
      ) as List?;
}

class SimilarTvShowsCall {
  static Future<ApiCallResponse> call({
    int? tvId = 1416,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Similar Tv Shows',
      apiUrl:
          'https://api.themoviedb.org/3/tv/$tvId/similar?language=en-US&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class SearchMoviesCall {
  static Future<ApiCallResponse> call({
    String? query = 'thor',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Movies',
      apiUrl:
          'https://api.themoviedb.org/3/search/movie?query=$query&include_adult=false&language=en-US&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class SearchTvShowsCall {
  static Future<ApiCallResponse> call({
    String? query = 'vikings',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Tv Shows',
      apiUrl:
          'https://api.themoviedb.org/3/search/tv?query=$query&include_adult=false&language=en-US&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class RecommendationMovieCall {
  static Future<ApiCallResponse> call({
    int? movieId = 19995,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Recommendation Movie',
      apiUrl:
          'https://api.themoviedb.org/3/movie/$movieId/recommendations?language=en-US&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class TvShowsRecommendationCall {
  static Future<ApiCallResponse> call({
    int? tvId = 3365,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Tv Shows Recommendation',
      apiUrl:
          'https://api.themoviedb.org/3/tv/$tvId/recommendations?language=en-US&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjdiMTgxYjU0YzUzZTI3YWU0ZmQ2ODllNTM2MDRmMSIsInN1YiI6IjY2NjE4NTI1OGNlMGFlYzRkYzAwYmVjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeG16h_0AlsLCZQ_RuMIgb9EV3_gq-4qIDUkVq5SK6Q',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
