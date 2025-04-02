import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final String _apiKey = 'AIzaSyCKph9DHaGVKx4hE3QmyEsfSg-3MFO3CPg';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    Response response = await _dio.get('$_baseUrl$endpoint&key=$_apiKey');
    return response.data;
  }
}
