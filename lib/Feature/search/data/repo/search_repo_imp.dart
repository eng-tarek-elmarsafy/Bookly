import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:bookly_app/Feature/search/data/repo/search_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;

  SearchRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      String search) async {
    try {
      var data =
          await apiService.get(endpoint: 'volumes?q=$search&maxResults=40');

      List<BookModel> books = [];

      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
