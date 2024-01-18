import 'package:expenses_manager/core/utils/map_to_csv.dart';
import 'package:expenses_manager/data/db/sqlite.dart';
import 'package:expenses_manager/data/models/expenses_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class ExpensesRepository {
  ExpensesRepository({
    required this.dbCore,
  });

  final DatabaseHelper dbCore;

  Future<List<ExpensesModel>> query() async {
    final db = await dbCore.getDatabase();
    final expenses = await db.query('expenses');
    if (expenses.isNotEmpty) {
      return expenses.map((e) => ExpensesModel.fromJson(e)).toList();
    }
    return [];
  }

  // String? Export expenses to CSV
  Future<String?> export() async {
    final db = await dbCore.getDatabase();
    final expenses = await db.query('expenses');
    if (expenses.isNotEmpty) {
      return mapListToCsv(expenses);
    }
    return '';
  }

  Future<void> insert(ExpensesModel expenses) async {
    final db = await dbCore.getDatabase();
    var json = expenses.toJson();
    await db.insert(
      'expenses',
      json,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> delete(String id) async {
    final db = await dbCore.getDatabase();
    final result = await db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result > 0;
  }
}
