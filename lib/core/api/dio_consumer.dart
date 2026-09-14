import 'dart:io';
import 'package:dio/dio.dart';
import '../errors/exceptions.dart';
import 'api_consumer.dart';
import 'end_points.dart';
import 'interceptor/app_interceptors.dart';
import 'interceptor/cache_interceptor.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 15);
    dio.options.receiveTimeout = const Duration(seconds: 15);

    dio.interceptors.add(AppInterceptors(dio: dio));
    dio.interceptors.add(CacheInterceptor());
    dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true, error: true),
    );
  }

  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool useCache = false,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: {'api_key': EndPoints.apiKey, ...?queryParameters},
        options: Options(extra: {'use_cache': useCache}),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData && data is Map<String, dynamic>
            ? await _toFormData(data)
            : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: isFormData && data is Map<String, dynamic>
            ? await _toFormData(data)
            : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData && data is Map<String, dynamic>
            ? await _toFormData(data)
            : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  Future<FormData> _toFormData(Map<String, dynamic> data) async {
    final Map<String, dynamic> map = {};

    for (var entry in data.entries) {
      if (entry.value is File) {
        File file = entry.value;
        map[entry.key] = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        );
      } else if (entry.value is List<File>) {
        List<File> files = entry.value;
        map[entry.key] = await Future.wait(
          files.map(
            (file) => MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      } else {
        map[entry.key] = entry.value;
      }
    }

    return FormData.fromMap(map);
  }
}
