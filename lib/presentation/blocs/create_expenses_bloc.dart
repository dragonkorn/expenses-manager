import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expenses_manager/core/di/locator.dart';
import 'package:expenses_manager/domain/usecases/add_expenses_usecase.dart';

part 'create_expenses_event.dart';
part 'create_expenses_state.dart';

class CreateExpensesBloc
    extends Bloc<CreateExpensesEvent, CreateExpensesState> {
  final AddExpensesUsecase _addExpensesUsecase = locator();

  CreateExpensesBloc() : super(CreateExpensesInitial()) {
    on<CreateExpensesStarted>(_onCreateExpensesStarted);
    on<CreateExpensesSubmitted>(_onCreateExpensesSubmitted);
  }

  void _onCreateExpensesStarted(
    CreateExpensesStarted event,
    Emitter<CreateExpensesState> emit,
  ) {
    emit(CreateExpensesInitial());
    emit(CreateExpensesInprogress());
  }

  void _onCreateExpensesSubmitted(
    CreateExpensesSubmitted event,
    Emitter<CreateExpensesState> emit,
  ) async {
    try {
      final isSuccess = await _addExpensesUsecase.call(AddExpensesUsecaseParams(
        description: event.description,
        amount: event.amount,
        expensesMethod: event.expensesMethod,
      ));
      if (isSuccess) {
        return emit(CreateExpensesSuccess());
      }
      return emit(CreateExpensesFailure());
    } catch (err) {
      emit(CreateExpensesFailure());
    }
  }
}
