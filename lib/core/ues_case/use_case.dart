import 'package:bookly_app/core/err/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, E> {
  Future<Either<Failure, T>> call([E param]);
}
