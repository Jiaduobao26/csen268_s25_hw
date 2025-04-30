import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'detail_page.dart';
import '../widgets/book_image_widget.dart';
import '../widgets/button_widget.dart';
import '../cubit/book_cubit.dart';
import '../cubit/book_state.dart';
import '../widgets/app_bar_widget.dart';


class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: 'Book Club Home',
        leadingIcon: const Icon(Icons.arrow_back),
        onLeadingPressed: () {
          Navigator.pop(context);  // navigates back to the previous page
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // sorting buttons
            BlocBuilder<BookCubit, BookState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sort by',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,         
                        fontWeight: FontWeight.w500, 
                      ),
                    ),
                    SortingButtonWidget(
                      context: context,
                      label: 'Author',
                      isActive: state.sortingMode == SortingMode.sortByAuthor,
                      onPressed: () => context.read<BookCubit>().sortByAuthor(),
                    ),
                    SortingButtonWidget(
                      context: context,
                      label: 'Title',
                      isActive: state.sortingMode == SortingMode.sortByTitle,
                      onPressed: () => context.read<BookCubit>().sortByTitle(),
                    ),
                  ],
                );
              },
            ),
            // book list
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Books',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 167.7,
                  child: BlocBuilder<BookCubit, BookState>(
                    builder: (context, state) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.books.length,
                        itemBuilder: (context, index) {
                          final book = state.books[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              child: BookImageWidget(book: book),
                              // go to detail page
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(book: book),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}