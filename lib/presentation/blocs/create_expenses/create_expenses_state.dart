part of 'create_expenses_bloc.dart';

sealed class CreateExpensesState extends Equatable {
  const CreateExpensesState();

  @override
  List<Object> get props => [];
}

final class CreateExpensesInitial extends CreateExpensesState {}

final class CreateExpensesInprogress extends CreateExpensesState {}

final class CreateExpensesSuccess extends CreateExpensesState {}

final class CreateExpensesFailure extends CreateExpensesState {}
