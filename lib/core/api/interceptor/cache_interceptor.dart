import 'package:dio/dio.dart';

class CacheInterceptor extends Interceptor {
  final _cache = <String, Response>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.method == 'GET' && options.extra['use_cache'] == true) {
      final response = _cache[options.uri.toString()];
      if (response != null) {
        return handler.resolve(response);
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.method == 'GET' && response.requestOptions.extra['use_cache'] == true) {
      _cache[response.requestOptions.uri.toString()] = response;
    }
    super.onResponse(response, handler);
  }
}