import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/book_cubit.dart';
import 'pages/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the BookCubit and provide it to the widget tree
    // This allows the BookCubit to be accessed by all widgets in the tree
    return BlocProvider(
      create: (context) => BookCubit()..init(), 
      child: MaterialApp(
        title: 'Book Club Home',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFFD1C3E0),
            brightness: Brightness.light,
          ),
        ),
        home: const ListPage(), 
      ),
    );
  }
}