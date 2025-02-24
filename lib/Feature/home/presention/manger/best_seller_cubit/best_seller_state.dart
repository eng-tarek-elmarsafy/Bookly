part of 'best_seller_cubit.dart';

sealed class BestSellerState extends Equatable {
  const BestSellerState();

  @override
  List<Object> get props => [];
}

final class BestSellerInitial extends BestSellerState {}

final class BestSellerLoading extends BestSellerState {}

final class BestSellerFailur extends BestSellerState {
  final String errMessage;

  const BestSellerFailur({required this.errMessage});
}

final class BestSellerSuccess extends BestSellerState {
  final List<BookModel> books;

  const BestSellerSuccess({required this.books});
}
