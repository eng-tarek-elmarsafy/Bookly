import 'package:bookly_app/Feature/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/Feature/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app/constns.dart';
import 'package:bookly_app/core/utils/api_service.dart';

import '../../../../core/utils/function/save_books_data.dart'
    show saveBooksData;

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    Map<String, dynamic> data =
        await _apiService.get(endpoint: 'volumes?q=programming');

    List<BookEntity> books = _getBooksList(data);

    saveBooksData(books, kFeatureBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    Map<String, dynamic> data =
        await _apiService.get(endpoint: 'volumes?q=sport&Sorting=newest');

    List<BookEntity> books = _getBooksList(data);
    saveBooksData(books, kNewsBox);
    return books;
  }

  List<BookEntity> _getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    for (var book in data['items']) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}
