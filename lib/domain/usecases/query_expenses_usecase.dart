import 'package:expenses_manager/data/expenses_repository.dart';
import 'package:expenses_manager/domain/entities/expenses.dart';
import 'package:expenses_manager/domain/usecases/use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class QueryExpensesUseCase extends NoParamUseCase<List<Expenses>> {
  QueryExpensesUseCase({
    required this.repository,
  });

  final ExpensesRepository repository;

  @override
  Future<List<Expenses>> call() async {
    try {
      final model = await repository.query();
      List<Expenses> expensesList = [];
      for (var item in model) {
        expensesList.add(
          Expenses.fromJson(
            item.toJson(),
          ),
        );
      }
      return expensesList;
    } catch (err) {
      rethrow;
    }
  }
}
