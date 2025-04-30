import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';
import '../model/book.dart';

class DetailPage extends StatelessWidget {
  final Book book;

  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: 'Book Detail',
        leadingIcon: const Icon(Icons.arrow_back),
        onLeadingPressed: () {
          Navigator.pop(context);  // navigates back to the previous page
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book Image
              Image.asset(
                book.imageUrl,
                width: 200,
                height: 333.3,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image_outlined, size: 80);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: 
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    )
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: 
                  Text(
                    book.author,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: 
                  Text(
                    book.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}