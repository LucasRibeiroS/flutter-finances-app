import 'package:finances_app/common_widgets/custom_app_bar.dart';
import 'package:finances_app/features/expenses/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesListScreen extends StatelessWidget {
  const ExpensesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Despesas',
        iconData: Icons.payments,
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                BorderRadius borderRadius = BorderRadius.circular(12.0);

                return Column(
                  children: [
                    Card(
                      elevation: 2,
                      shadowColor: Colors.transparent,
                      color: Theme.of(context).colorScheme.surface,
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      shape: RoundedRectangleBorder(borderRadius: borderRadius),
                      child: ExpenseItem(
                        title: "Item $index",
                        category: "Casa",
                        borderRadius: borderRadius,
                      ),
                    ),
                  ],
                );
              }, childCount: 10),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            )
          ],
        ),
      ),
    );
  }
}
