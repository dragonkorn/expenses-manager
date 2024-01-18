import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expenses_manager/core/di/locator.dart';
import 'package:expenses_manager/domain/usecases/export_expenses_usecase.dart';

part 'export_expenses_event.dart';
part 'export_expenses_state.dart';

class ExportExpensesBloc
    extends Bloc<ExportExpensesEvent, ExportExpensesState> {
  final ExportExpensesUseCase _exportExpensesUseCase = locator();

  ExportExpensesBloc() : super(ExportExpensesInitial()) {
    on<ExportExpensesDownloadPressed>(_onExportExpensesDownloadPressed);
  }

  void _onExportExpensesDownloadPressed(
    ExportExpensesDownloadPressed event,
    Emitter<ExportExpensesState> emit,
  ) {
    emit(ExportExpensesInprogress());
    try {
      _exportExpensesUseCase.call();
      emit(ExportExpensesSuccess());
    } catch (err) {
      emit(ExportExpensesFailure());
    }
  }
}
