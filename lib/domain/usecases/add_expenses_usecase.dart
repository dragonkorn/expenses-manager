import 'package:expenses_manager/core/di/locator.dart';
import 'package:expenses_manager/data/expenses_repository.dart';
import 'package:expenses_manager/data/models/expenses_model.dart';
import 'package:expenses_manager/domain/usecases/use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@injectable
class AddExpensesUsecase extends UseCase<AddExpensesUsecaseParams, bool> {
  AddExpensesUsecase();

  final ExpensesRepository repository = locator();

  @override
  Future<bool> call(AddExpensesUsecaseParams params) async {
    Uuid uuid = const Uuid();
    // Convert Expenses to ExpensesModel
    final expensesModel = ExpensesModel(
      id: uuid.v4(),
      description: params.description,
      amount: params.amount,
      date: DateTime.now(),
      expensesMethod: params.expensesMethod,
      isExpenses: params.isExpenses,
    );

    try {
      await repository.insert(expensesModel);
      return true;
    } catch (err) {
      rethrow;
    }
  }
}

class AddExpensesUsecaseParams {
  final String description;
  final double amount;
  final String expensesMethod;
  final int isExpenses;

  AddExpensesUsecaseParams({
    required this.description,
    required this.amount,
    required this.expensesMethod,
    required this.isExpenses,
  });
}
