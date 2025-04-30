import 'package:equatable/equatable.dart';
import '../model/book.dart';

// sorting mode enum
enum SortingMode { sortByTitle, sortByAuthor }

// BookState class
class BookState extends Equatable {
  final List<Book> books;

  final SortingMode sortingMode;
  const BookState({required this.books, required this.sortingMode});

  @override
  List<Object> get props => [books, sortingMode];

  BookState copyWith({required List<Book> books, required SortingMode sortingMode}) {
    return BookState(
      books: books,
      sortingMode: sortingMode, 
    );
  }
}