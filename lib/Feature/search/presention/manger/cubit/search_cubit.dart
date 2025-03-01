import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:bookly_app/Feature/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future<void> fetchSearch({ String search = 'flutter' }) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchBooks(search);
    result.fold((failure) {
      emit(SearchFailur(errMessage: failure.err));
    }, (books) {
      emit(SearchSuccess(books: books));
    });
  }
}
