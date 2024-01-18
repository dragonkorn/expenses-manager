import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expenses_manager/core/di/locator.dart';
import 'package:expenses_manager/core/log.dart';
import 'package:expenses_manager/domain/entities/expenses.dart';
import 'package:expenses_manager/domain/usecases/delete_expenses_usecase.dart';
import 'package:expenses_manager/domain/usecases/query_expenses_usecase.dart';

part 'expenses_list_event.dart';
part 'expenses_list_state.dart';

class ExpensesListBloc extends Bloc<ExpensesListEvent, ExpensesListState> {
  final QueryExpensesUseCase queryExpensesUseCase = locator();
  final DeleteExpensesUseCase deleteExpensesUseCase = locator();
  final logger = AppLogger().logger;
  ExpensesListBloc() : super(ExpensesListInitial()) {
    on<ExpensesListFetched>(_onExpensesListFetched);
    on<ExpensesItemDeleted>(_onExpensesItemDeleted);
  }

  void _onExpensesListFetched(
    ExpensesListFetched event,
    Emitter<ExpensesListState> emit,
  ) async {
    emit(ExpensesListLoading());
    try {
      final expensesList = await queryExpensesUseCase.call();
      emit(
        ExpensesListLoaded(
          expensesList: expensesList,
        ),
      );
    } catch (err) {
      logger.e(err);
      emit(ExpensesListError());
    }
  }

  void _onExpensesItemDeleted(
    ExpensesItemDeleted event,
    Emitter<ExpensesListState> emit,
  ) async {
    emit(ExpensesListLoading());
    try {
      final result = await deleteExpensesUseCase.call(event.id);
      if (!result) {
        emit(ExpensesListError());
        return;
      }
      final expensesList = await queryExpensesUseCase.call();
      emit(
        ExpensesListLoaded(
          expensesList: expensesList,
        ),
      );
    } catch (err) {
      logger.e(err);
      emit(ExpensesListError());
    }
  }
}
