import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final String text;
  final ImageProvider imageProvider;
  final void Function()? onTap;

  const DetailsCard({
    Key? key,
    required this.text,
    required this.imageProvider,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Theme.of(context).colorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: 120,
          child: Stack(
            children: [
              Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(6.0)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 22,
                      fontWeight: FontWeight.w600,

                        ),
                  ),
                ),
              ),
              // Expanded(
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(horizontal: 10),
              //     alignment: Alignment.topLeft,
              //     child: FittedBox(
              //       fit: BoxFit.fitHeight,
              //       child: Text(
              //         text,
              //         style: Theme.of(context).textTheme.headline4?.copyWith(
              //           fontSize: 22,
              //           fontFamily: GoogleFonts.concertOne().fontFamily,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
