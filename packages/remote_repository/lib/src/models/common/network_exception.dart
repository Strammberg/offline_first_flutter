import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exception.freezed.dart';

/// Represents the type of network exceptions that might occur during the usage
/// of the app
@freezed
class NetworkException with _$NetworkException {
  /// The request is cancelled
  const factory NetworkException.requestCancelled({DioException? error}) =
      RequestCancelled;

  /// User is not authorized to do the request
  const factory NetworkException.unauthorizedRequest({DioException? error}) =
      UnauthorizedRequest;

  /// Bad request
  const factory NetworkException.badRequest({DioException? error}) = BadRequest;

  /// The path of the request was not found
  const factory NetworkException.notFound(String reason,
      {DioException? error}) = NotFound;

  /// Method is not allowed
  const factory NetworkException.methodNotAllowed({DioException? error}) =
      MethodNotAllowed;

  /// Not acceptable
  const factory NetworkException.notAcceptable({DioException? error}) =
      NotAcceptable;

  /// Requested timeout
  const factory NetworkException.requestTimeout({DioException? error}) =
      RequestTimeout;

  /// Send a timeout
  const factory NetworkException.sendTimeout({DioException? error}) =
      SendTimeout;

  /// On conflict
  const factory NetworkException.conflict({DioException? error}) = Conflict;

  /// Internal server error
  const factory NetworkException.internalServerError({DioException? error}) =
      InternalServerError;

  /// Not implemented
  const factory NetworkException.notImplemented({DioException? error}) =
      NotImplemented;

  /// Service is unavailable
  const factory NetworkException.serviceUnavailable({DioException? error}) =
      ServiceUnavailable;

  /// User has not internet connection
  const factory NetworkException.noInternetConnection({DioException? error}) =
      NoInternetConnection;

  /// The request has a format issue
  const factory NetworkException.formatException({DioException? error}) =
      FormatException;

  /// Unable to process the request/response
  const factory NetworkException.unableToProcess({DioException? error}) =
      UnableToProcess;

  /// Default error
  const factory NetworkException.defaultError(
    String error, {
    DioException? dioError,
  }) = DefaultError;

  /// An unexpected error appeared
  const factory NetworkException.unexpectedError({DioException? error}) =
      UnexpectedError;

  /// Handles the response of the server
  static NetworkException handleResponse(int? statusCode,
      {DioException? error}) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return NetworkException.unauthorizedRequest(error: error);
      case 404:
        return NetworkException.notFound('Not found', error: error);
      case 409:
        return NetworkException.conflict(error: error);
      case 408:
        return NetworkException.requestTimeout(error: error);
      case 500:
        return NetworkException.internalServerError(error: error);
      case 503:
        return NetworkException.serviceUnavailable(error: error);
      default:
        final responseCode = statusCode;
        return NetworkException.defaultError(
          'Received invalid status code: $responseCode',
        );
    }
  }

  /// Returns the dio exception
  static NetworkException getDioException(dynamic error) {
    if (error is Exception) {
      try {
        NetworkException networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions =
                  NetworkException.requestCancelled(error: error);
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = NetworkException.requestTimeout(error: error);
              break;
            case DioExceptionType.unknown:
              networkExceptions =
                  NetworkException.noInternetConnection(error: error);
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = NetworkException.sendTimeout(error: error);
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = NetworkException.sendTimeout(error: error);
              break;
            default:
              networkExceptions =
                  NetworkException.unexpectedError(error: error);
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkException.noInternetConnection();
        } else {
          networkExceptions = const NetworkException.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkException.formatException();
      } catch (_) {
        return const NetworkException.unexpectedError();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return const NetworkException.unableToProcess();
      } else {
        return const NetworkException.unexpectedError();
      }
    }
  }

  /// Returns the error message
  static String getErrorMessage(NetworkException networkExceptions) {
    var errorMessage = '';
    networkExceptions.when(
      notImplemented: (_) {
        errorMessage = 'ERROR.GENERAL';
      },
      requestCancelled: (_) {
        errorMessage = 'ERROR.GENERAL';
      },
      internalServerError: (_) {
        errorMessage = 'ERROR.SERVER_ERROR';
      },
      notFound: (String reason, _) {
        errorMessage = reason;
      },
      serviceUnavailable: (_) {
        errorMessage = 'ERROR.SERVER_UNAVAILABLE';
      },
      methodNotAllowed: (_) {
        errorMessage = 'ERROR.GENERAL';
      },
      badRequest: (_) {
        errorMessage = 'ERROR.GENERAL';
      },
      unauthorizedRequest: (_) {
        errorMessage = 'ERROR.GENERAL';
      },
      unexpectedError: (_) {
        errorMessage = 'ERROR.GENERAL';
      },
      requestTimeout: (_) {
        errorMessage = 'ERROR.SERVER_TIMEOUT';
      },
      noInternetConnection: (_) {
        errorMessage = 'ERROR.NO_INTERNET_CONNECTION';
      },
      conflict: (_) {
        errorMessage = 'ERROR.GENERAL';
      },
      sendTimeout: (_) {
        errorMessage = 'ERROR.GENERAL';
      },
      unableToProcess: (_) {
        errorMessage = 'ERROR.GENERAL';
      },
      defaultError: (String error, _) {
        errorMessage = error;
      },
      formatException: (_) {
        errorMessage = 'ERROR.GENERAL';
      },
      notAcceptable: (_) {
        errorMessage = 'ERROR.GENERAL';
      },
    );
    return errorMessage;
  }

  static DioException? getDioError(NetworkException networkExceptions) {
    DioException? dioError = null;
    networkExceptions.when(
      notImplemented: (e) {
        dioError = e;
      },
      requestCancelled: (e) {
        dioError = e;
      },
      internalServerError: (e) {
        dioError = e;
      },
      notFound: (String reason, e) {
        dioError = e;
      },
      serviceUnavailable: (e) {
        dioError = e;
      },
      methodNotAllowed: (e) {
        dioError = e;
      },
      badRequest: (e) {
        dioError = e;
      },
      unauthorizedRequest: (e) {
        dioError = e;
      },
      unexpectedError: (e) {
        dioError = e;
      },
      requestTimeout: (e) {
        dioError = e;
      },
      noInternetConnection: (e) {
        dioError = e;
      },
      conflict: (e) {
        dioError = e;
      },
      sendTimeout: (e) {
        dioError = e;
      },
      unableToProcess: (e) {
        dioError = e;
      },
      defaultError: (String error, e) {
        dioError = e;
      },
      formatException: (e) {
        dioError = e;
      },
      notAcceptable: (e) {
        dioError = e;
      },
    );
    return dioError;
  }
}
