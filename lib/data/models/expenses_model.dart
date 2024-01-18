import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenses_model.freezed.dart';
part 'expenses_model.g.dart';

@freezed
class ExpensesModel with _$ExpensesModel {
  factory ExpensesModel({
    required String id,
    required double amount,
    required DateTime date,
    required String expensesMethod,
    required String description,
    int? isExpenses,
  }) = _ExpensesModel;

  factory ExpensesModel.fromJson(Map<String, dynamic> json) =>
      _$ExpensesModelFromJson(json);
}
