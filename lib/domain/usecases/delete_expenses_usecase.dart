import 'package:expenses_manager/data/expenses_repository.dart';
import 'package:expenses_manager/domain/usecases/use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteExpensesUseCase extends UseCase<String, bool> {
  DeleteExpensesUseCase({
    required this.repository,
  });

  final ExpensesRepository repository;

  @override
  Future<bool> call(String params) {
    repository.delete(params);
    return Future.value(true);
  }
}
