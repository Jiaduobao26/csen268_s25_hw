import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Icon leadingIcon;
  final VoidCallback? onLeadingPressed;

  const AppBarWidget({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).colorScheme.onSurface, 
          fontWeight: FontWeight.w400,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: leadingIcon,
        color: Theme.of(context).colorScheme.onSurface,
        onPressed: onLeadingPressed ?? () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_outlined),
          color:Theme.of(context).colorScheme.onSurface,
          onPressed: () {
            // todo: Open account page
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}