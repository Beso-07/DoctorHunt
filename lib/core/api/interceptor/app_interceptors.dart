import 'package:dio/dio.dart';
import '../../cache/cache_helper.dart';
import '../end_points.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors({required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[APIKeys.contentType] = APIKeys.applicationJson;
    options.headers[APIKeys.language] = CacheHelper.getData(key: 'lang') ?? 'ar';

    final token = CacheHelper.getData(key: 'token');
    if (token != null && token.toString().isNotEmpty) {
      options.headers[APIKeys.authorization] = '${APIKeys.bearer}$token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // التعامل مع انتهاء صلاحية التوكن (401)
    if (err.response?.statusCode == 401) {
      final refreshToken = CacheHelper.getData(key: 'refresh_token');

      if (refreshToken != null && refreshToken.toString().isNotEmpty) {
        try {
          // 1. طلب Access Token جديد باستخدام الـ Refresh Token
          final response = await dio.post(
            EndPoints.refreshToken,
            data: {'refresh_token': refreshToken},
          );

          final newAccessToken = response.data['access_token'];
          final newRefreshToken = response.data['refresh_token'];

          // 2. حفظ التوكنز الجديدة
          await CacheHelper.saveData(key: 'token', value: newAccessToken);
          if (newRefreshToken != null) {
            await CacheHelper.saveData(key: 'refresh_token', value: newRefreshToken);
          }

          // 3. تحديث Header الطلب الحالي
          err.requestOptions.headers[APIKeys.authorization] = '${APIKeys.bearer}$newAccessToken';

          // 4. إعادة إرسال الطلب الأصلي ببيانات التوكن الجديدة
          final clonedRequest = await dio.fetch(err.requestOptions);
          return handler.resolve(clonedRequest);

        } catch (e) {
          // في حال فشل تجديد التوكن
          await CacheHelper.clearData();
          return super.onError(err, handler);
        }
      }
    }

    super.onError(err, handler);
  }
}