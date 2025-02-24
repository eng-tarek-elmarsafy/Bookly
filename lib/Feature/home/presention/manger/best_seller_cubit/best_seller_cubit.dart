import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:bookly_app/Feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.homeRepo) : super(BestSellerInitial());

  final HomeRepo homeRepo;

  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerLoading());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold((failure) {
      emit(BestSellerFailur(errMessage: failure.err));
    }, (books) {
      emit(BestSellerSuccess(books: books));
    });
  }
}
