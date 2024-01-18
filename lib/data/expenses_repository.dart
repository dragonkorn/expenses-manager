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

  Future<void> insert(ExpensesModel expenses) async {
    final db = await dbCore.getDatabase();
    await db.insert(
      'expenses',
      expenses.toJson(),
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
