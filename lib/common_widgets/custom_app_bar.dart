import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.w700,
          color: Theme.of(context).textTheme.displayMedium?.color,
        ),
      ),
      leading: Navigator.of(context).canPop()
          ? BackButton(color: Theme.of(context).textTheme.displayMedium?.color)
          : null,
      backgroundColor: Colors.transparent,
    );
  }
}
