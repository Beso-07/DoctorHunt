// core/errors/exceptions.dart
import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
}

class CacheException implements Exception {
  final String message;
  CacheException({required this.message});
}

class NetworkException implements Exception {
  final String message = "لا يوجد اتصال بالإنترنت";
}

void handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      throw ServerException(message: "انتهت مهلة الاتصال بالخادم");
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(message: e.response?.data['message'] ?? "طلب غير صالح");
        case 401:
          throw ServerException(message: e.response?.data['message'] ?? "غير مصرح لك بالدخول");
        case 403:
          throw ServerException(message: "الوصول ممنوع");
        case 404:
          throw ServerException(message: "الصفحة أو البيانات غير موجودة");
        case 409:
          throw ServerException(message: "حدث تعارض في البيانات");
        case 500:
        case 502:
          throw ServerException(message: "خطأ داخلي في الخادم");
        default:
          throw ServerException(message: e.response?.data['message'] ?? "حدث خطأ غير معروف");
      }
    case DioExceptionType.cancel:
      throw ServerException(message: "تم إلغاء الطلب");
    case DioExceptionType.connectionError:
      throw NetworkException();
    default:
      throw ServerException(message: "حدث خطأ أثناء الاتصال بالخادم");
  }
}