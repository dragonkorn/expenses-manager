import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenses.freezed.dart';
part 'expenses.g.dart';

@freezed
class Expenses with _$Expenses {
  factory Expenses({
    required String id,
    required double amount,
    required DateTime date,
    required String expensesMethod,
    required String description,
  }) = _Expenses;

  factory Expenses.fromJson(Map<String, dynamic> json) =>
      _$ExpensesFromJson(json);
}
