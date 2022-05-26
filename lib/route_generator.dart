import 'package:flutter/material.dart';
import 'package:finances_app/main.dart';
import 'package:finances_app/features/expenses/screens/new_expense_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    
    switch (settings.name) {
      case '/expenses/new':
        return MaterialPageRoute(builder: (_) => const NewExpenseScreen());

      default:
        return _mainRoute();
    }
  }

  static Route<dynamic> _mainRoute() =>
      MaterialPageRoute(builder: (_) => const MainScreen());
}
