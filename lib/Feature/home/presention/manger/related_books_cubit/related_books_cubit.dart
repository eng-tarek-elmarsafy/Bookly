import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:bookly_app/Feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'related_books_state.dart';

class RelatedBooksCubit extends Cubit<RelatedBooksState> {
  RelatedBooksCubit(this.homeRepo) : super(RelatedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchRelatedBooks({required String type}) async {
    emit(RelatedBooksLoading());
    var result = await homeRepo.fetchRelatedBooks(type: type);
    result.fold((failure) {
      emit(RelatedBooksFailur(errMessage: failure.err));
    }, (books) {
      emit(RelatedBooksSuccess(books: books));
    });
  }
}
