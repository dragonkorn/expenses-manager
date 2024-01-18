part of 'export_expenses_bloc.dart';

sealed class ExportExpensesEvent extends Equatable {
  const ExportExpensesEvent();

  @override
  List<Object> get props => [];
}

class ExportExpensesDownloadPressed extends ExportExpensesEvent {
  const ExportExpensesDownloadPressed();
}
