import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCard extends StatelessWidget {
  final String text;
  final ImageProvider imageProvider;

  const DetailsCard({
    Key? key,
    required this.text,
    required this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: SizedBox(
          width: double.infinity,
          height: 120,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.topLeft,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 22,
                        fontFamily: GoogleFonts.concertOne().fontFamily,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
