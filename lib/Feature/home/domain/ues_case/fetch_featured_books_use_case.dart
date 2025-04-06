import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Feature/home/domain/repos/home_repo.dart';
import 'package:bookly_app/core/err/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/ues_case/use_case.dart' show UseCase;

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call([void param]) {
    return homeRepo.fetchFeaturedBooks();
  }
}
