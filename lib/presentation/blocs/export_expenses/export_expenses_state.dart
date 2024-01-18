part of 'export_expenses_bloc.dart';

sealed class ExportExpensesState extends Equatable {
  const ExportExpensesState();

  @override
  List<Object> get props => [];
}

final class ExportExpensesInitial extends ExportExpensesState {}

final class ExportExpensesInprogress extends ExportExpensesState {}

final class ExportExpensesSuccess extends ExportExpensesState {}

final class ExportExpensesFailure extends ExportExpensesState {}
