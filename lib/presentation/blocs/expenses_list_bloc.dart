import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expenses_manager/data/storage/add_expenses.dart';
import 'package:expenses_manager/domain/entities/expenses.dart';

part 'expenses_list_event.dart';
part 'expenses_list_state.dart';

class ExpensesListBloc extends Bloc<ExpensesListEvent, ExpensesListState> {
  final _expensesStorageManager = ExpensesStorageManager();
  ExpensesListBloc() : super(ExpensesListInitial()) {
    on<ExpensesListFetched>(_onExpensesListFetched);
  }

  void _onExpensesListFetched(
    ExpensesListFetched event,
    Emitter<ExpensesListState> emit,
  ) async {
    emit(ExpensesListLoading());
    try {
      final expensesList = await _expensesStorageManager.getExpenses();
      final List<Expenses> response = [];
      for (var model in expensesList) {
        response.add(
          Expenses.fromJson(
            model.toJson(),
          ),
        );
      }
      emit(
        ExpensesListLoaded(
          expensesList: response,
        ),
      );
    } catch (err) {
      emit(ExpensesListError());
    }
  }
}
