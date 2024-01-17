import 'package:expenses_manager/presentation/blocs/create_expenses_bloc.dart';
import 'package:expenses_manager/presentation/blocs/expenses_list_bloc.dart';
import 'package:expenses_manager/presentation/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ExpensesListBloc>().add(ExpensesListFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Row(),
          const SizedBox(height: 16.0),
          Text(
            '0',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          BlocBuilder<ExpensesListBloc, ExpensesListState>(
            builder: (context, state) {
              if (state is ExpensesListLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ExpensesListError) {
                return const Center(
                  child: Text('Error'),
                );
              }
              if (state is ExpensesListLoaded) {
                return Column(
                  children: state.expensesList.map((expenses) {
                    return Text(
                      '${expenses.amount} ${expenses.expensesMethod} ${expenses.description}',
                      style: Theme.of(context).textTheme.titleLarge,
                    );
                  }).toList(),
                );
              }
              return const Center(
                child: Text('...'),
              );
            },
          ),
        ],
      ),
      floatingActionButton:
          BlocConsumer<CreateExpensesBloc, CreateExpensesState>(
        listener: (context, state) {
          if (state is CreateExpensesInprogress) {
            Navigator.pushNamed(context, AppRouter.addExpenses);
          }
        },
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              context.read<CreateExpensesBloc>().add(
                    CreateExpensesStarted(),
                  );
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
