// import 'package:scenex/core/errors/exceptions.dart';
// import 'package:scenex/core/errors/failures.dart';

// class ExceptionToFailure {
//   const ExceptionToFailure._();

//   static Failure map(Object error) {
//     // Network Exceptions
//     if (error is NetworkException) {
//       final message = error.message.toLowerCase();

//       if (message.contains('no internet') || message.contains('connection')) {
//         return const NoInternetFailure();
//       }
//       if (message.contains('timeout')) {
//         return const TimeoutFailure();
//       }
//       return NetworkFailure('errorNetworkGeneral', fallbackMessage: error.message);
//     }

//     // Server Exceptions
//     if (error is ServerException) {
//       final message = error.message.toLowerCase();

//       if (message.contains('bad request') || message.contains('400')) {
//         return const BadRequestFailure();
//       }
//       if (message.contains('unauthorized') || message.contains('401')) {
//         return const UnauthorizedFailure();
//       }
//       if (message.contains('forbidden') || message.contains('403')) {
//         return ForbiddenFailure(message: error.message);
//       }
//       if (message.contains('not found') || message.contains('404')) {
//         return const NotFoundFailure();
//       }
//       if (message.contains('too many') || message.contains('429')) {
//         return const TooManyRequestsFailure();
//       }
//       if (message.contains('internal') || message.contains('500')) {
//         return const InternalServerFailure();
//       }
//       if (message.contains('service unavailable') || message.contains('503')) {
//         return const ServiceUnavailableFailure();
//       }
//       if (message.contains('bad gateway') || message.contains('502')) {
//         return const BadGatewayFailure();
//       }
//       if (message.contains('gateway timeout') || message.contains('504')) {
//         return const GatewayTimeoutFailure();
//       }
//       return ServerFailure('errorServerUnavailable', fallbackMessage: error.message);
//     }

//     // Cache Exceptions
//     if (error is CacheException) {
//       final message = error.message.toLowerCase();

//       if (message.contains('read')) {
//         return const CacheReadFailure();
//       }
//       if (message.contains('write') || message.contains('save')) {
//         return const CacheWriteFailure();
//       }
//       return CacheFailure('errorCacheRead', fallbackMessage: error.message);
//     }

//     // Generic AppException
//     if (error is AppException) {
//       return const UnknownFailure();
//     }

//     // Truly unexpected errors
//     return const UnknownFailure();
//   }
// }