import 'dart:convert';

import 'package:expenses_manager/data/models/expenses_model.dart';
import 'package:expenses_manager/data/storage/storage_manager.dart';

class ExpensesStorageManager {
  ExpensesStorageManager();

  static const String expenses = 'expenses';
  final storageManager = StorageManager();

  Future<List<ExpensesModel>> getExpenses() async {
    final String jsonString = await storageManager.read(expenses);

    /// Convert expensesJsonString to List<ExpensesModel>
    late dynamic expensesJsonList;
    try {
      expensesJsonList = jsonDecode(jsonString);
    } catch (err) {
      expensesJsonList = jsonDecode('[]');
    }
    var expensesModelList = <ExpensesModel>[];
    for (var expensesJson in expensesJsonList) {
      ExpensesModel expensesModel = ExpensesModel.fromJson(expensesJson);
      expensesModelList.add(expensesModel);
    }
    return expensesModelList;
  }

  Future<bool> addExpenses(ExpensesModel newExpenses) async {
    final String jsonString = await storageManager.read(expenses);

    /// Convert expensesJsonString to List<ExpensesModel>
    late dynamic expensesJsonList;
    try {
      expensesJsonList = jsonDecode(jsonString);
    } catch (err) {
      expensesJsonList = jsonDecode('[]');
    }
    var expensesModelList = <ExpensesModel>[];
    for (var expensesJson in expensesJsonList) {
      ExpensesModel expensesModel = ExpensesModel.fromJson(expensesJson);
      expensesModelList.add(expensesModel);
    }

    try {
      expensesModelList.add(newExpenses);
      for (var expensesModel in expensesModelList) {
        final json = expensesModel.toJson();
        expensesJsonList.add(json);
      }
      final encoded = jsonEncode(expensesJsonList);
      await storageManager.write(expenses, encoded);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
