import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Feature/home/domain/repos/home_repo.dart';
import 'package:bookly_app/core/err/failure.dart';
import 'package:bookly_app/core/ues_case/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewsetBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;

  FetchNewsetBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call([void param]) {
    return homeRepo.fetchNewestBooks();
  }
}
