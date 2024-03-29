import 'dart:io';
import 'package:expenses_manager/presentation/blocs/export_expenses/export_expenses_bloc.dart';
import 'package:intl/intl.dart';

import 'package:expenses_manager/domain/entities/expenses.dart';
import 'package:expenses_manager/presentation/blocs/create_expenses/create_expenses_bloc.dart';
import 'package:expenses_manager/presentation/blocs/expenses_list/expenses_list_bloc.dart';
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

    _fetchExpensesList();
  }

  void _fetchExpensesList() async {
    sleep(const Duration(milliseconds: 300));
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
          BlocListener<ExportExpensesBloc, ExportExpensesState>(
            listener: (context, state) {
              if (state is ExportExpensesFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Failed to export expenses'),
                  ),
                );
              }
            },
            child: IconButton(
              onPressed: () {
                context
                    .read<ExportExpensesBloc>()
                    .add(const ExportExpensesDownloadPressed());
              },
              icon: const Icon(Icons.download),
            ),
          ),
        ],
      ),
      body: BlocBuilder<ExpensesListBloc, ExpensesListState>(
        builder: (context, state) {
          final totalExpenses = (state is ExpensesListLoaded)
              ? state.expensesList.fold<double>(
                  0,
                  (previousValue, element) =>
                      previousValue +
                      (element.isExpenses == 1 ? element.amount : 0))
              : 0.00;
          final total = (state is ExpensesListLoaded)
              ? state.expensesList.fold<double>(
                  0,
                  (previousValue, element) =>
                      previousValue +
                      (element.amount * (element.isExpenses == 1 ? -1 : 1)))
              : 0.00;
          return Column(
            children: <Widget>[
              const Row(),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state is ExpensesListLoaded
                        ? 'Total: ${NumberFormat().format(total)}'
                        : 'Total: 0.00',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: total < 0
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    '(${NumberFormat().format(totalExpenses)})',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ExpensesList(
                state: state,
              ),
            ],
          );
        },
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

class ExpensesList extends StatelessWidget {
  const ExpensesList({Key? key, required this.state}) : super(key: key);

  final ExpensesListState state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesListBloc, ExpensesListState>(
      builder: (context, state) {
        return _buildExpensesList(context, state);
      },
    );
  }

  Widget _buildExpensesList(BuildContext context, ExpensesListState state) {
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
      return Expanded(
        child: ListView.builder(
          itemCount: state.expensesList.length,
          itemBuilder: (context, index) {
            final expenses = state.expensesList[index];
            return ExpensesItem(
              expenses: expenses,
            );
          },
        ),
      );
    }
    return const Center(
      child: Text('...'),
    );
  }
}

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({
    Key? key,
    required this.expenses,
  }) : super(key: key);

  final Expenses expenses;

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to remove this record?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                // dismiss dialog
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Confirm',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                context.read<ExpensesListBloc>().add(
                      ExpensesItemDeleted(
                        id: expenses.id,
                      ),
                    );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            DateFormat('MM/dd').format(expenses.date),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            DateFormat('yyyy').format(expenses.date),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            DateFormat('hh:mm').format(expenses.date),
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              NumberFormat().format(expenses.amount),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: expenses.isExpenses == 1
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              switch (expenses.expensesMethod) {
                '1' => 'Transfer',
                '2' => 'Credit-Card',
                '3' => 'Cash',
                _ => 'Others'
              },
            ),
          ),
        ],
      ),
      subtitle: Text(
        expenses.description,
      ),
      trailing: IconButton(
        onPressed: () {
          _showMyDialog(context);
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
