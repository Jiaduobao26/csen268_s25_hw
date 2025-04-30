import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_state.dart';
import '../model/book.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit()
      : super(const BookState(books: [], sortingMode: SortingMode.sortByAuthor)) {
    init();
  }

  // initialize the list of books from JSON
  Future<void> init() async {
    try {
      // load the JSON file from assets
      final String jsonString = await rootBundle.loadString('assets/book_list.json');
      final List<dynamic> jsonData = json.decode(jsonString);

      // parse the JSON data into a list of Book objects
      final List<Book> bookList = jsonData.map((book) => Book.fromJson(book)).toList();

      // initially sort list by author's last name
      final sortedBooks = List<Book>.from(bookList)
        ..sort((a, b) {
          final lastNameA = a.author.split(' ').last;
          final lastNameB = b.author.split(' ').last;
          return lastNameA.compareTo(lastNameB);
        });

      // emit the state with the loaded book list and sorting by author
      emit(state.copyWith(books: sortedBooks, sortingMode: SortingMode.sortByAuthor));
    } catch (e) {
      // handle any errors that occur during loading
      print('Error loading books from JSON: $e');
    }
  }

  // sort books by title
  void sortByTitle() {
    final sortedBooks = List<Book>.from(state.books)
      ..sort((a, b) => a.title.compareTo(b.title));
    emit(state.copyWith(books: sortedBooks, sortingMode: SortingMode.sortByTitle));
  }

  // sort books by the author's last name
  void sortByAuthor() {
    final sortedBooks = List<Book>.from(state.books)
      ..sort((a, b) {
        // extract the last name of the author for both books
        final lastNameA = a.author.split(' ').isNotEmpty ? a.author.split(' ').last : a.author;
        final lastNameB = b.author.split(' ').isNotEmpty ? b.author.split(' ').last : b.author;
        return lastNameA.compareTo(lastNameB); // compare the last names
      });
    emit(state.copyWith(books: sortedBooks, sortingMode: SortingMode.sortByAuthor));
  }
}