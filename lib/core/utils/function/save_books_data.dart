import 'package:hive_flutter/hive_flutter.dart';

import '../../../Feature/home/domain/entities/book_entity.dart';

void saveBooksData(List<BookEntity> books, String nameBox) {
  Box box = Hive.box<BookEntity>(nameBox);
  box.addAll(books);
}
