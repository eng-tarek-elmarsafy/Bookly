import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/ues_case/fetch_newset_books_use_case.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fetchNewsetBooksUseCase) : super(NewsetBooksInitial());

  final FetchNewsetBooksUseCase fetchNewsetBooksUseCase;

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());

    var resuilt = await fetchNewsetBooksUseCase.call();

    resuilt.fold(
      (failure) => emit(
        NewsetBooksFailure(errMessage: failure.errMessage),
      ),
      (books) => emit(
        NewsetBooksSuccess(books: books),
      ),
    );
  }
}
