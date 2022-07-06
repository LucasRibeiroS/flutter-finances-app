import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;
  final IconData? iconData;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.iconData,
    this.textStyle,
    this.backgroundColor = Colors.transparent,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconData != null
              ? Icon(
                  iconData,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                )
              : const SizedBox.shrink(),
          const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ],
      ),
      actions: actions,
      backgroundColor: backgroundColor,
    );
  }
}
