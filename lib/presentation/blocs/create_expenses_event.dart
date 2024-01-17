part of 'create_expenses_bloc.dart';

sealed class CreateExpensesEvent extends Equatable {
  const CreateExpensesEvent();

  @override
  List<Object> get props => [];
}

final class CreateExpensesStarted extends CreateExpensesEvent {}

final class CreateExpensesSubmitted extends CreateExpensesEvent {
  final double amount;
  final String expensesMethod;
  final String description;

  const CreateExpensesSubmitted({
    required this.amount,
    required this.expensesMethod,
    required this.description,
  });

  @override
  List<Object> get props => [
        amount,
        expensesMethod,
        description,
      ];
}
