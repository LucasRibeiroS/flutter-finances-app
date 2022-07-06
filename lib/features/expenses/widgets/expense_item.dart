import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  final String title;
  final String category;
  final BorderRadius? borderRadius;

  const ExpenseItem({
    Key? key,
    required this.title,
    required this.category,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleMediumStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.1,
        );
    final labelMediumStyle = Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Theme.of(context).colorScheme.outline,
        );

    return InkWell(
      onTap: () {},
      borderRadius: borderRadius,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              child: Center(
                child: Icon(
                  Icons.home_outlined,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleMediumStyle,
                  ),
                  Row(
                    children: [
                      Text(
                        category,
                        style: labelMediumStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "R\$25,00",
                  style: titleMediumStyle,
                ),
                Text(
                  "11 mar",
                  style: labelMediumStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
