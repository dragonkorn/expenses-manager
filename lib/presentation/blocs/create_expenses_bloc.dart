import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expenses_manager/data/models/expenses_model.dart';
import 'package:expenses_manager/data/storage/add_expenses.dart';
import 'package:uuid/uuid.dart';

part 'create_expenses_event.dart';
part 'create_expenses_state.dart';

class CreateExpensesBloc
    extends Bloc<CreateExpensesEvent, CreateExpensesState> {
  final _expensesStorageManager = ExpensesStorageManager();

  CreateExpensesBloc() : super(CreateExpensesInitial()) {
    on<CreateExpensesStarted>(_onCreateExpensesStarted);
    on<CreateExpensesSubmitted>(_onCreateExpensesSubmitted);
  }

  void _onCreateExpensesStarted(
    CreateExpensesStarted event,
    Emitter<CreateExpensesState> emit,
  ) {
    emit(CreateExpensesInprogress());
  }

  void _onCreateExpensesSubmitted(
    CreateExpensesSubmitted event,
    Emitter<CreateExpensesState> emit,
  ) async {
    Uuid uuid = const Uuid();
    ExpensesModel expenses = ExpensesModel(
      id: uuid.v4(),
      amount: event.amount,
      date: DateTime.now(),
      expensesMethod: event.expensesMethod,
      description: event.description,
    );
    try {
      final _ = await _expensesStorageManager.addExpenses(expenses);
      emit(CreateExpensesSuccess());
    } catch (err) {
      emit(CreateExpensesFailure());
    }
  }
}
