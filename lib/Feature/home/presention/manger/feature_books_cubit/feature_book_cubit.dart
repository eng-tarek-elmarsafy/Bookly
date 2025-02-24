import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'feature_book_state.dart';

class FeatureBookCubit extends Cubit<FeatureBookState> {
  FeatureBookCubit() : super(FeatureBookInitial());

  
}
