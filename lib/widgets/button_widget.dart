import 'package:flutter/material.dart';

class SortingButtonWidget extends StatelessWidget {
  final BuildContext context;
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  const SortingButtonWidget(
      {super.key,
      required this.context,
      required this.label,
      required this.isActive,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: SizedBox(
        height: 30,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: isActive ? Theme.of(context).colorScheme.surface : Colors.white,
            side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant, width: 1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          ),
          child: Text(
            label, 
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}