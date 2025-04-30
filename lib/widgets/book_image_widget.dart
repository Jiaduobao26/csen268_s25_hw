import 'package:flutter/material.dart';
import '../model/book.dart';

class BookImageWidget extends StatelessWidget {
  final Book book;

  const BookImageWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 167.7,
      child: Image.asset(
        book.imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.broken_image_outlined, size: 80); 
        },
      ),
    );
  }
}