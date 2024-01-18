import 'package:expenses_manager/presentation/blocs/create_expenses/create_expenses_bloc.dart';
import 'package:expenses_manager/presentation/blocs/expenses_list/expenses_list_bloc.dart';
import 'package:expenses_manager/presentation/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpensesScreen extends StatefulWidget {
  const AddExpensesScreen({Key? key}) : super(key: key);

  @override
  State<AddExpensesScreen> createState() => _AddExpensesScreenState();
}

class _AddExpensesScreenState extends State<AddExpensesScreen> {
  String _expensesValue = '';
  String _expensesMethod = '1';
  String _description = '';
  bool _isExpenses = true;

  void _onSubmit() {
    context.read<CreateExpensesBloc>().add(
          CreateExpensesSubmitted(
            amount: double.parse(_expensesValue),
            expensesMethod: _expensesMethod,
            description: _description,
            isExpenses: _isExpenses ? 1 : 0,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Expenses'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocListener<CreateExpensesBloc, CreateExpensesState>(
              listener: (context, state) {
                if (state is CreateExpensesSuccess) {
                  // fetch expenses list
                  context.read<ExpensesListBloc>().add(ExpensesListFetched());
                  Navigator.pop(context);
                }
                if (state is CreateExpensesFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to add expenses'),
                    ),
                  );
                }
              },
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _expensesValue = value;
                      });
                    },
                  ),
                  // Switch input between expenses or income
                  Row(
                    children: [
                      Switch(
                        value: _isExpenses,
                        onChanged: (newValue) {
                          setState(() {
                            _isExpenses = newValue;
                            _expensesMethod = '0';
                          });
                        },
                      ),
                      const Text('Is Expenses? (uncheck if income)'),
                    ],
                  ),
                  ExpensesMethod(
                    isExpenses: _isExpenses,
                    onChanged: (value) {
                      setState(() {
                        _expensesMethod = value;
                      });
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ElevatedButton(
                    onPressed: _onSubmit,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
