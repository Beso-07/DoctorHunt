class Failure {
  final String errorKey;
  final String? fallbackMessage;

  const Failure(this.errorKey, {this.fallbackMessage});

  @override
  String toString() => fallbackMessage ?? errorKey;
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.errorKey, {super.fallbackMessage});
}

class NoInternetFailure extends NetworkFailure {
  const NoInternetFailure() : super('errorNoInternet', fallbackMessage: 'No internet connection');
}

class TimeoutFailure extends NetworkFailure {
  const TimeoutFailure() : super('errorTimeout', fallbackMessage: 'Request timeout');
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorKey, {super.fallbackMessage});
}

class BadRequestFailure extends ServerFailure {
  const BadRequestFailure() : super('errorBadRequest', fallbackMessage: 'Bad request');
}

class UnauthorizedFailure extends ServerFailure {
  const UnauthorizedFailure() : super('errorUnauthorized', fallbackMessage: 'Unauthorized');
}

class ForbiddenFailure extends ServerFailure {
  const ForbiddenFailure({String? message})
      : super(
    'errorForbidden',
    fallbackMessage: message ?? 'Forbidden',
  );
}

class NotFoundFailure extends ServerFailure {
  const NotFoundFailure() : super('errorNotFound', fallbackMessage: 'Not found');
}

class TooManyRequestsFailure extends ServerFailure {
  const TooManyRequestsFailure() : super('errorTooManyRequests', fallbackMessage: 'Too many requests');
}

class InternalServerFailure extends ServerFailure {
  const InternalServerFailure() : super('errorInternalServer', fallbackMessage: 'Internal server error');
}

class ServiceUnavailableFailure extends ServerFailure {
  const ServiceUnavailableFailure() : super('errorServiceUnavailable', fallbackMessage: 'Service unavailable');
}

class BadGatewayFailure extends ServerFailure {
  const BadGatewayFailure() : super('errorBadGateway', fallbackMessage: 'Bad gateway');
}

class GatewayTimeoutFailure extends ServerFailure {
  const GatewayTimeoutFailure() : super('errorGatewayTimeout', fallbackMessage: 'Gateway timeout');
}

// Cache-related failures
class CacheFailure extends Failure {
  const CacheFailure(super.errorKey, {super.fallbackMessage});
}

class CacheReadFailure extends CacheFailure {
  const CacheReadFailure() : super('errorCacheRead', fallbackMessage: 'Cache read failed');
}

class CacheWriteFailure extends CacheFailure {
  const CacheWriteFailure() : super('errorCacheWrite', fallbackMessage: 'Cache write failed');
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super('errorUnknown', fallbackMessage: 'Unknown error');
}

class InvalidResponseFailure extends Failure {
  const InvalidResponseFailure() : super('errorInvalidResponse', fallbackMessage: 'Invalid response');
}

class ValidationFailure extends ServerFailure {
  const ValidationFailure(String message) : super('errorValidation', fallbackMessage: message);
}