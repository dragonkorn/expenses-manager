import 'package:expenses_manager/presentation/screens/add_expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:expenses_manager/presentation/screens/home.dart';

class AppRouter {
  static const String home = '/';
  static const String addExpenses = '/add-expenses';

  static Map<String, Widget Function(BuildContext)> get routes => {
        AppRouter.home: (context) => const MyHomePage(),
        AppRouter.addExpenses: (context) => const AddExpensesScreen(),
      };
}
