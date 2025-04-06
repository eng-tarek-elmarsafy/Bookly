import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/err/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
