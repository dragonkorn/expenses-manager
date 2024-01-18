part of 'expenses_list_bloc.dart';

sealed class ExpensesListEvent extends Equatable {
  const ExpensesListEvent();

  @override
  List<Object> get props => [];
}

final class ExpensesListFetched extends ExpensesListEvent {}

final class ExpensesItemDeleted extends ExpensesListEvent {
  final String id;

  const ExpensesItemDeleted({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
