import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errMessage: 'Connection timeout. Please try again.');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errMessage: 'Request timed out while sending data.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errMessage:
                'Response timed out. The server took too long to respond.');
      case DioExceptionType.badCertificate:
        return ServerFailure.fromResponse(e);

      case DioExceptionType.badResponse:
        return ServerFailure(
            errMessage: 'Request timed out while sending data.');
      case DioExceptionType.cancel:
        return ServerFailure(
            errMessage: 'Request was cancelled before completion.');
      case DioExceptionType.connectionError:
        return ServerFailure(
            errMessage:
                'Connection error. Please check your internet connection.');
      case DioExceptionType.unknown:
        return ServerFailure(
            errMessage:
                'An unexpected error occurred. Please try again later.');
    }
  }
  factory ServerFailure.fromResponse(DioException response) {
    int statusCode = response.response!.statusCode!;
    if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Yore response was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'There is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
          errMessage: response.response!.data['error']['message']);
    }
    return ServerFailure(
        errMessage: 'An unexpected error occurred. Please try again later.');
  }
}
