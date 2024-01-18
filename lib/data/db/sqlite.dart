import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@singleton
class DatabaseHelper {
  DatabaseHelper();

  static Database? db;

  Future<Database> getDatabase() async {
    if (db != null) {
      return db!;
    }
    db = await initialDb();
    return db!;
  }

  Future<Database> initialDb() async {
    return await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      'expenses_database.db',
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE expenses ( id TEXT PRIMARY KEY, amount REAL, date DATE, expensesMethod TEXT, description TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }
}
