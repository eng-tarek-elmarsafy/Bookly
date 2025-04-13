import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Feature/home/domain/ues_case/fetch_featured_books_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> featuredBooks() async {
    emit(FeaturedBooksLoading());
    var resuilt = await featuredBooksUseCase.call();

    resuilt.fold(
      (failure) => emit(
        FeaturedBooksFailure(errMessage: failure.errMessage),
      ),
      (books) => emit(
        FeaturedBooksSuccess(books: books),
      ),
    );
  }
}
