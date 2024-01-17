import 'package:expenses_manager/presentation/blocs/create_expenses_bloc.dart';
import 'package:expenses_manager/presentation/blocs/expenses_list_bloc.dart';
import 'package:expenses_manager/presentation/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CreateExpensesBloc()),
        BlocProvider(create: (context) => ExpensesListBloc()),
      ],
      // create: (context) => SubjectBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green[700]!),
          useMaterial3: true,
        ),
        // routes: Map<String, Widget Function(BuildContext)>,
        routes: AppRouter.routes,
        initialRoute: AppRouter.home,
      ),
    );
  }
}
