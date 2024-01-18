part of 'expenses_list_bloc.dart';

sealed class ExpensesListState extends Equatable {
  const ExpensesListState();

  @override
  List<Object> get props => [];
}

final class ExpensesListInitial extends ExpensesListState {}

final class ExpensesListLoading extends ExpensesListState {}

final class ExpensesListError extends ExpensesListState {}

final class ExpensesListLoaded extends ExpensesListState {
  final List<Expenses> expensesList;

  const ExpensesListLoaded({
    required this.expensesList,
  });

  @override
  List<Object> get props => [
        expensesList,
      ];
}
