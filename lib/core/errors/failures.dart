import 'package:dio/dio.dart';

abstract class Failure {
  final String err;

  Failure(this.err);
}

class ServerFailure extends Failure {
  ServerFailure(super.err);

  // ignore: non_constant_identifier_names
  factory ServerFailure.DioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection time out with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send time out with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recive time out with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        Response<dynamic>? err = dioError.response;
        if (err!.statusCode == 400 ||
            err.statusCode == 401 ||
            err.statusCode == 403) {
          ServerFailure.fromResponse(err.statusCode, err.data);
        }
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error, Please try again!');
    }
    return ServerFailure('Opps There was an Error, Please try again');
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
