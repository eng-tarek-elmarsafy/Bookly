import 'package:bookly_app/Feature/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/Feature/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Feature/home/domain/repos/home_repo.dart';
import 'package:bookly_app/core/err/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImp extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImp(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> booksLocal = homeLocalDataSource.fetchFeaturedBooks();
      if (booksLocal.isNotEmpty) {
        return right(booksLocal);
      }
      List<BookEntity> books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> bookLocal = homeLocalDataSource.fetchNewestBooks();
      if (bookLocal.isNotEmpty) {
        return right(bookLocal);
      }
      List<BookEntity> books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }
}
