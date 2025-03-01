part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {
  final List<BookModel>? books;

  const SearchInitial({this.books});
}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<BookModel> books;

  const SearchSuccess({required this.books});
}

final class SearchFailur extends SearchState {
  final String errMessage;

  const SearchFailur({required this.errMessage});
}
