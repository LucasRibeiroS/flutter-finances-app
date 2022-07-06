import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:finances_app/common_widgets/custom_app_bar.dart';
import 'package:finances_app/common_widgets/expandable_fab.dart';

import 'package:finances_app/core/settings/settings_provider.dart';
import 'package:finances_app/core/home/widgets/details_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightMode = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'App name',
        iconData: Icons.area_chart,
        actions: [
          IconButton(
            icon: Icon(
              lightMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              context.read<SettingsProvider>().updateThemeMode(
                    lightMode ? ThemeMode.dark : ThemeMode.light,
                  );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DetailsCard(
                text: "Lorem ipsum",
                imageProvider: const AssetImage(
                  'assets/images/expenses.jpg',
                ),
                onTap: () => Navigator.of(context).pushNamed('/expenses'),
              ),
              DetailsCard(
                text: "Lorem ipsum",
                imageProvider: const AssetImage(
                  'assets/images/chart.jpg',
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ExpandableFab(
        iconData: Icons.add,
        closeIconData: Icons.close,
        distance: 10,
        children: [
          ActionButton(
            onPressed: () => Navigator.of(context).pushNamed('/expenses/new'),
            icon: const Icon(Icons.payments),
            label: const Text("Despesa"),
          ),
          ActionButton(
            onPressed: () => {},
            icon: const Icon(Icons.savings),
            label: const Text("Receita"),
          ),
        ],
      ),
    );
  }
}
